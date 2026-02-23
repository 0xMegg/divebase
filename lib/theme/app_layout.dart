import 'package:flutter/material.dart';

/// Dana's 2차 화면 Figma 프레임 기준 (375×812).
class AppLayout {
  AppLayout._();

  static const double figmaFrameWidth = 375;
  static const double figmaFrameHeight = 812;

  static Size get figmaFrameSize => const Size(figmaFrameWidth, figmaFrameHeight);

  /// 화면 너비를 Figma 기준으로 클램프 (가운데 정렬용).
  static double clampWidth(double width) =>
      width.clamp(0.0, figmaFrameWidth).toDouble();
}
