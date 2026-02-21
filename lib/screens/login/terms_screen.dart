import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

class TermsScreen extends StatelessWidget {
  static const routeName = '/terms';

  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('서비스 이용약관')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '본 약관은 ㈜○○○(이하 “회사”)가 제공하는 ○○○ 서비스\n'
                    '(이하 “서비스”)의 이용과 관련하여 회사와 이용자 간의 권리, '
                    '의무 및 책임사항을 규정함을 목적으로 합니다.\n\n'
                    '제1조 (목적)\n'
                    '본 약관은 회사가 제공하는 서비스의 이용조건 및 절차, 회사와 '
                    '이용자 간의 권리·의무 및 책임사항, 기타 필요한 사항을 규정함을 '
                    '목적으로 합니다.\n\n'
                    '제2조 (정의)\n'
                    '서비스란 회사가 모바일 앱, 웹 등을 통해 제공하는 모든 관련 '
                    '서비스를 의미합니다.\n\n'
                    '이용자란 본 약관에 동의하고 회사가 제공하는 서비스를 이용하는 '
                    '회원 및 비회원을 말합니다.\n\n'
                    '회원이란 회사에 개인정보를 제공하여 회원가입을 완료한 자를 '
                    '말합니다.\n',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      label: '취소',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryButton(
                      label: '동의',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
