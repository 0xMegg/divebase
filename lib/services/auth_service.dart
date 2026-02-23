import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_client.dart';

/// Auth state and operations (Supabase). Use only after Supabase.initialize().
class AuthService {
  static GoTrueClient get _auth => supabase.auth;

  static User? get currentUser => _auth.currentUser;

  static Stream<AuthState> get authStateChanges => _auth.onAuthStateChange;

  static Future<void> signInWithApple() async {
    await _auth.signInWithOAuth(OAuthProvider.apple);
  }

  static Future<void> signInWithGoogle() async {
    await _auth.signInWithOAuth(OAuthProvider.google);
  }

  static Future<void> signOut() => _auth.signOut();
}
