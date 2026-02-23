import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_layout.dart';

/// 로그인&가입 - Figma node 696:7779 (content 696:7781 구조: Branding 375×610, Text 375×18, Form/Sign 375×44×2).
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = AppLayout.clampWidth(constraints.maxWidth);
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight -
                      (MediaQuery.paddingOf(context).top + MediaQuery.paddingOf(context).bottom),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _BrandingSection(width: w),
                      _TextSection(width: w),
                      _FormSignSection(width: w, onSignIn: () => context.go('/home'), onConsent: () => context.push('/login/consent')),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Branding: 로고 영역. Figma 375×610였으나 한 화면에 로그인 전체가 보이도록 높이 축소.
class _BrandingSection extends StatelessWidget {
  const _BrandingSection({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 220,
      child: Center(
        child: SizedBox(
          width: 188,
          height: 71,
          child: Center(
            child: Text(
              'Dive Base',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Text: 375×18, Figma "Continue with" (16px white, center).
class _TextSection extends StatelessWidget {
  const _TextSection({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 18,
      child: Center(
        child: Text(
          'Continue with',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Form / Sign: Figma 44×44 원형 버튼 2개(Google, Apple) 가운데, 간격 10.
class _FormSignSection extends StatelessWidget {
  const _FormSignSection({
    required this.width,
    required this.onSignIn,
    required this.onConsent,
  });

  final double width;
  final VoidCallback onSignIn;
  final VoidCallback onConsent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SignButton(icon: Icons.g_mobiledata_rounded, onPressed: onSignIn), // Google
              const SizedBox(width: 10),
              _SignButton(icon: Icons.apple, onPressed: onSignIn), // Apple
            ],
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onConsent,
            style: TextButton.styleFrom(
              minimumSize: Size(width - 48, 36),
              padding: EdgeInsets.zero,
            ),
            child: Text(
              '서비스 이용약관 동의',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Figma Frame 23435/23436: 44×44, 흰 배경, 원형(cornerRadius 100).
class _SignButton extends StatelessWidget {
  const _SignButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, size: 24, color: Colors.black87),
        ),
      ),
    );
  }
}
