import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client access. Use only after Supabase.initialize() in main.
SupabaseClient get supabase => Supabase.instance.client;
