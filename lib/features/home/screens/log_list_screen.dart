import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_nav_bar.dart';

/// 홈/다이빙로그/조회 - Figma 696:8041 (Bars/Nav Bars: Large "Total DB" → 다이빙 로그, Form/Field Tables).
class LogListScreen extends StatelessWidget {
  const LogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        title: '다이빙 로그',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: ListView(
          children: [
            // Figma _Partials/Tables: Title Content + Caption (날짜). 실제 데이터 연동 시 교체.
            ListTile(
              title: Text('NO.12345', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: const Text('2026-01-01'),
              onTap: () => context.push('/home/logs/1'),
            ),
          ],
        ),
      ),
    );
  }
}
