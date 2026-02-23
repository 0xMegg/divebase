import 'package:flutter/material.dart';

/// 화면 공통: SafeArea + 키보드 대응 (Figma 375×812 기준).
class SafeAreaScreen extends StatelessWidget {
  const SafeAreaScreen({
    super.key,
    required this.child,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget child;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}
