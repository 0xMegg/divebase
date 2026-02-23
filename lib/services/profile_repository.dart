import 'supabase_client.dart';

/// profiles 테이블 연동 (DIVEBASE_DB_SCHEMA).
class ProfileRepository {
  static String get _table => 'profiles';

  /// 현재 사용자 프로필 조회. Supabase 초기화 후 사용.
  static Future<Map<String, dynamic>?> getCurrent() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return null;
    final res = await supabase.from(_table).select().eq('user_id', userId).maybeSingle();
    return res;
  }

  /// 프로필 upsert (가입/수정).
  static Future<void> upsert(Map<String, dynamic> data) async {
    await supabase.from(_table).upsert(data);
  }
}
