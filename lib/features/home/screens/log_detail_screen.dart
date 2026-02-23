import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_nav_bar.dart';

/// 홈/다이빙로그/수정/Default (상세 보기).
class LogDetailScreen extends StatelessWidget {
  const LogDetailScreen({super.key, this.diveId});

  final String? diveId;

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
      body: Center(child: Text('로그 상세 id: ${diveId ?? "-"}')),
    );
  }
}
