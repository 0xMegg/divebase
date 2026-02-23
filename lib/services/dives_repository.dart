import 'supabase_client.dart';

/// scuba_dives / free_dives 테이블 연동 (DIVEBASE_DB_SCHEMA).
class DivesRepository {
  static Future<List<Map<String, dynamic>>> getScubaDives() async {
    final res = await supabase.from('scuba_dives').select().order('dive_date', ascending: false);
    return List<Map<String, dynamic>>.from(res);
  }

  static Future<List<Map<String, dynamic>>> getFreeDives() async {
    final res = await supabase.from('free_dives').select().order('dive_date', ascending: false);
    return List<Map<String, dynamic>>.from(res);
  }

  static Future<Map<String, dynamic>?> getScubaDive(String id) async {
    final res = await supabase.from('scuba_dives').select().eq('id', id).maybeSingle();
    return res;
  }

  static Future<Map<String, dynamic>?> getFreeDive(String id) async {
    final res = await supabase.from('free_dives').select().eq('id', id).maybeSingle();
    return res;
  }
}
