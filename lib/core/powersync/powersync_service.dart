import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app_schema.dart';

late PowerSyncDatabase db;

Future<void> initPowerSync() async {
  final dir = await getApplicationDocumentsDirectory();
  final path = join(dir.path, 'chato.db');

  db = PowerSyncDatabase(schema: schema, path: path);
  await db.initialize();
}

class PowerSyncService {
  final PowerSyncDatabase db;

  PowerSyncService(this.db);

  bool _connected = false;

  Future<void> connect() async {
    if (_connected) return;

    print('🔌 PowerSync CONNECT');

    await db.connect(connector: SupabasePowerSyncConnector());

    _connected = true;
  }

  Future<void> disconnect() async {
    if (!_connected) return;

    print('❌ PowerSync DISCONNECT');

    await db.disconnectAndClear();
    _connected = false;
  }
}

class SupabasePowerSyncConnector extends PowerSyncBackendConnector {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    final session = _supabase.auth.currentSession;

    if (session == null) {
      print('❌ No session');
      return null;
    }

    print('✅ Token fetched');

    return PowerSyncCredentials(
      endpoint: 'https://69ce6f0e8fa42c16d7f75a91.powersync.journeyapps.com',
      userId: session.user.id, // هنا ضع معرف المستخدم
      token: session.accessToken,
    );
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final batch = await database.getCrudBatch();
    if (batch == null) return;

    try {
      for (final op in batch.crud) {
        final table = _supabase.from(op.table);

        switch (op.op) {
          case UpdateType.put:
            await table.upsert(op.opData!);
            break;

          case UpdateType.patch:
            await table.update(op.opData!).eq('id', op.id);
            break;

          case UpdateType.delete:
            await table.delete().eq('id', op.id);
            break;
        }
      }

      await batch.complete();
    } catch (e) {
      print('❌ Upload error: $e');
      await batch.complete(writeCheckpoint: null);
      rethrow;
    }
  }
}
