import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_nav_bar.dart';

/// 마이페이지/고객지원.
class MypageSupportScreen extends StatelessWidget {
  const MypageSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        title: '고객지원',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('문의, FAQ, 공지 등'),
      ),
    );
  }
}
