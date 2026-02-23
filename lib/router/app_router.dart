import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/screens/login_consent_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/login_verify_screen.dart';
import '../features/auth/screens/terms_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/home/screens/log_detail_screen.dart';
import '../features/home/screens/log_list_screen.dart';
import '../features/log/screens/log_complete_screen.dart';
import '../features/log/screens/log_option_screen.dart';
import '../features/log/screens/log_step_screen.dart';
import '../features/main/screens/main_start_screen.dart';
import '../features/main/screens/main_shell_screen.dart';
import '../features/mypage/screens/mypage_edit_screen.dart';
import '../features/mypage/screens/mypage_screen.dart';
import '../features/mypage/screens/mypage_support_screen.dart';
import '../features/mypage/screens/mypage_withdraw_screen.dart';

/// Route names for 2차 화면 (Dana's).
/// Figma: https://www.figma.com/design/XCDfITElnlYCooopNPxPeV/Dana-s?node-id=696-7778
class AppRoutes {
  static const String login = 'login';
  static const String loginConsent = 'loginConsent';
  static const String loginVerify = 'loginVerify';
  static const String terms = 'terms';
  static const String main = 'main';
  static const String home = 'home';
  static const String logList = 'logList';
  static const String logDetail = 'logDetail';
  static const String logOption = 'logOption';
  static const String logScubaStep = 'logScubaStep';
  static const String logFreeStep = 'logFreeStep';
  static const String logComplete = 'logComplete';
  static const String mypage = 'mypage';
  static const String mypageEdit = 'mypageEdit';
  static const String mypageSupport = 'mypageSupport';
  static const String mypageWithdraw = 'mypageWithdraw';
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    // 시작 화면 (Figma Main 696:7792)
    GoRoute(
      path: '/',
      name: 'start',
      builder: (context, state) => const MainStartScreen(),
    ),
    // Auth (no shell)
    GoRoute(
      path: '/login',
      name: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'consent',
          name: AppRoutes.loginConsent,
          builder: (context, state) => const LoginConsentScreen(),
        ),
        GoRoute(
          path: 'verify',
          name: AppRoutes.loginVerify,
          builder: (context, state) => const LoginVerifyScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/terms',
      name: AppRoutes.terms,
      builder: (context, state) => const TermsScreen(),
    ),
    // Log wizard (no shell)
    GoRoute(
      path: '/log',
      redirect: (context, state) => '/log/option',
      routes: [
        GoRoute(
          path: 'option',
          name: AppRoutes.logOption,
          builder: (context, state) => const LogOptionScreen(),
        ),
        GoRoute(
          path: 'scuba/:step',
          name: AppRoutes.logScubaStep,
          builder: (context, state) {
            final step = int.tryParse(state.pathParameters['step'] ?? '1') ?? 1;
            return LogStepScreen(kind: 'scuba', step: step);
          },
        ),
        GoRoute(
          path: 'free/:step',
          name: AppRoutes.logFreeStep,
          builder: (context, state) {
            final step = int.tryParse(state.pathParameters['step'] ?? '1') ?? 1;
            return LogStepScreen(kind: 'free', step: step);
          },
        ),
        GoRoute(
          path: 'complete',
          name: AppRoutes.logComplete,
          builder: (context, state) => const LogCompleteScreen(),
        ),
      ],
    ),
    // Main shell (tab bar)
    ShellRoute(
      builder: (context, state, child) => MainShellScreen(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutes.main,
          redirect: (context, state) => '/home',
        ),
        GoRoute(
          path: '/home',
          name: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
          routes: [
            GoRoute(
              path: 'logs',
              name: AppRoutes.logList,
              builder: (context, state) => const LogListScreen(),
            ),
            GoRoute(
              path: 'logs/:id',
              name: AppRoutes.logDetail,
              builder: (context, state) {
                final id = state.pathParameters['id'];
                return LogDetailScreen(diveId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/mypage',
          name: AppRoutes.mypage,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: MyPageScreen(),
          ),
          routes: [
            GoRoute(
              path: 'edit',
              name: AppRoutes.mypageEdit,
              builder: (context, state) => const MypageEditScreen(),
            ),
            GoRoute(
              path: 'support',
              name: AppRoutes.mypageSupport,
              builder: (context, state) => const MypageSupportScreen(),
            ),
            GoRoute(
              path: 'withdraw',
              name: AppRoutes.mypageWithdraw,
              builder: (context, state) => const MypageWithdrawScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
