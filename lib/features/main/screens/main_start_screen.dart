import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/svg_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/figma_frame.dart';

/// Figma Main (node 696:7792) - 랜딩(시작) 화면.
/// 배경 #0046FF, 로고(188×71) 중앙. 탭 시 로그인으로 이동.
class MainStartScreen extends StatelessWidget {
  const MainStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FigmaFrame(
        child: GestureDetector(
          onTap: () => context.go('/login'),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: SizedBox(
              width: 188,
              height: 71,
              child: SvgPicture.asset(
                SvgAssets.logoDiveBase,
                width: 188,
                height: 71,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
