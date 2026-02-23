import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/app_nav_bar.dart';

/// 로그 등록 Step 1~7 - Figma 696:8374 등 (Views/Progress Bars Fill 10%~, Form + 다음/완료).
class LogStepScreen extends StatelessWidget {
  const LogStepScreen({
    super.key,
    required this.kind,
    required this.step,
  });

  final String kind; // 'scuba' | 'free'
  final int step;

  @override
  Widget build(BuildContext context) {
    final title = kind == 'scuba' ? '스쿠버' : '프리';
    final progress = step / 7;
    return Scaffold(
      appBar: AppNavBar(
        title: '$title Step $step',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Figma Views/Progress Bars: track #F2F4F8, fill primary
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: const Color(0xFFF2F4F8),
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 4,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Text(
                  'Step $step 내용 (Figma 연동)',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              FilledButton(
                onPressed: () {
                  if (step < 7) {
                    context.push('/log/$kind/${step + 1}');
                  } else {
                    context.go('/log/complete');
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(step < 7 ? '다음' : '완료'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
