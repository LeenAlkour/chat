import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> loadSupabase() async {
  await Supabase.initialize(
    url: 'https://wyzurqspgcptjvxoaaxj.supabase.co',
    anonKey: 'sb_publishable_Yjq5P8gl1UHebeFDgvc9qQ_9l_hgI37',
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
  );
}
