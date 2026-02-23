import 'package:flutter/material.dart';

import '../theme/app_layout.dart';

/// Figma 프레임 비율(375×812) 유지. 화면이 더 크면 가운데만 375×812 비율로 표시하고 나머지는 레터박스.
class FigmaFrame extends StatelessWidget {
  const FigmaFrame({super.key, required this.child});

  final Widget child;

  static const double _aspectRatio =
      AppLayout.figmaFrameWidth / AppLayout.figmaFrameHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: _aspectRatio,
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: AppLayout.figmaFrameWidth,
            height: AppLayout.figmaFrameHeight,
            child: child,
          ),
        ),
      ),
    );
  }
}
