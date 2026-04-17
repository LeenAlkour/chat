import 'package:chato/core/powersync/app_schema.dart';
import 'package:chato/core/powersync/supabase.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final _log = Logger('powersync-supabase');

/// Postgres Response codes that we cannot recover from by retrying.
final List<RegExp> fatalResponseCodes = [
  RegExp(r'^22...$'), // Class 22 — Data Exception
  RegExp(r'^23...$'), // Class 23 — Integrity Constraint Violation
  RegExp(r'^42501$'), // INSUFFICIENT PRIVILEGE (RLS violation)
];

// ─── Singleton DB instance ───────────────────────────────────────────────────

late final PowerSyncDatabase db;

// ─── Helpers ─────────────────────────────────────────────────────────────────

Future<String> getDatabasePath() async {
  const dbFilename = 'chato.db';
  if (kIsWeb) return dbFilename;
  final dir = await getApplicationSupportDirectory();
  return join(dir.path, dbFilename);
}

bool isLoggedIn() =>
    Supabase.instance.client.auth.currentSession?.accessToken != null;

// ─── Initialisation ───────────────────────────────────────────────────────────

Future<void> openDatabase() async {
  db = PowerSyncDatabase(schema: schema, path: await getDatabasePath());
  await db.initialize();
  _log.info('✅ PowerSync DB initialized');

  await loadSupabase();

  SupabaseConnector? currentConnector;

  if (isLoggedIn()) {
    currentConnector = SupabaseConnector();
    db.connect(connector: currentConnector);
    _log.info('🔌 PowerSync connected (existing session)');
  }

  Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
    final event = data.event;

    if (event == AuthChangeEvent.signedIn) {
      currentConnector = SupabaseConnector();
      db.connect(connector: currentConnector!);
      _log.info('🔌 PowerSync connected (sign-in)');
    } else if (event == AuthChangeEvent.signedOut) {
      _log.info('❌ PowerSync disconnecting (sign-out)');
      currentConnector = null;
      await db.disconnectAndClear(); // clears local data on logout
    } else if (event == AuthChangeEvent.tokenRefreshed) {
      currentConnector?.prefetchCredentials();
    }
  });
}

// ─── Connector ───────────────────────────────────────────────────────────────

class SupabaseConnector extends PowerSyncBackendConnector {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    final session = _supabase.auth.currentSession;
    if (session == null) {
      _log.warning('fetchCredentials: no active session');
      return null;
    }

    return PowerSyncCredentials(
      endpoint: 'https://69ce6f0e8fa42c16d7f75a91.powersync.journeyapps.com',
      userId: session.user.id,
      token: session.accessToken,
    );
  } 

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final batch = await database.getCrudBatch();
    if (batch == null) return;

    _log.info('⬆️  Uploading ${batch.crud.length} operation(s)…');

    try {
      for (final op in batch.crud) {
        final table = _supabase.from(op.table);

        switch (op.op) {
          case UpdateType.put:
            final data = Map<String, dynamic>.of(op.opData!)..['id'] = op.id;
            if (op.table == 'messages') {
        data['status'] = 'sent'; // بدل pending
      }
            await table.upsert(data);
          case UpdateType.patch:
            await table.update(op.opData!).eq('id', op.id);
          case UpdateType.delete:
            await table.delete().eq('id', op.id);
        }
      }

      await batch.complete();
      _log.info('✅ Batch upload complete');
    } on PostgrestException catch (e) {
      if (e.code != null &&
          fatalResponseCodes.any((re) => re.hasMatch(e.code!))) {
        _log.severe('Fatal DB error ${e.code}, completing batch to skip: $e');
        await batch.complete(writeCheckpoint: null);
      } else {
        _log.warning('Transient upload error, will retry: $e');
        rethrow;
      }
    } catch (e) {
      _log.severe('Unexpected upload error: $e');
      rethrow;
    }
  }
}
