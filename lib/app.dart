import 'package:flutter/material.dart';

import 'screens/home/db_home_screen.dart';
import 'screens/login/consent_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/terms_screen.dart';
import 'screens/my/my_info_screen.dart';
import 'screens/my/my_page_screen.dart';
import 'theme.dart';

class DiveBaseApp extends StatelessWidget {
  const DiveBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dive Base',
      theme: buildDiveBaseTheme(),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        ConsentScreen.routeName: (context) => const ConsentScreen(),
        TermsScreen.routeName: (context) => const TermsScreen(),
        DbHomeScreen.routeName: (context) => const DbHomeScreen(),
        MyPageScreen.routeName: (context) => const MyPageScreen(),
        MyInfoScreen.routeName: (context) => const MyInfoScreen(),
      },
    );
  }
}
