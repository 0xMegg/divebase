import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';
import '../home/db_home_screen.dart';
import 'consent_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, DbHomeScreen.routeName);
            },
            child: const Text('둘러보기'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                'Dive Base',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              Text(
                '다이빙 기록을 더 쉽고, 더 즐겁게.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Text(
                'Continue with',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Google로 계속하기',
                onPressed: () {
                  Navigator.pushNamed(context, ConsentScreen.routeName);
                },
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Apple로 계속하기',
                onPressed: () {
                  Navigator.pushNamed(context, ConsentScreen.routeName);
                },
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('도움말'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
