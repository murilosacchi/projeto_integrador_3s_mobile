import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://itqfucskqgtowewknams.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0cWZ1Y3NrcWd0b3dld2tuYW1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzA5MTMyOTIsImV4cCI6MjA0NjQ4OTI5Mn0.Mm_lw_WpGl8TPXXp9Hy5HgViIVC62MFuMZoTfYA2sCY';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
