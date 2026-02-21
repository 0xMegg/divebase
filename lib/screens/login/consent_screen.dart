import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';
import '../home/db_home_screen.dart';
import 'terms_screen.dart';

class ConsentScreen extends StatefulWidget {
  static const routeName = '/consent';

  const ConsentScreen({super.key});

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool agreeAll = false;
  bool agreeService = false;
  bool agreePrivacy = false;
  bool agreeMarketing = false;

  void _toggleAll(bool value) {
    setState(() {
      agreeAll = value;
      agreeService = value;
      agreePrivacy = value;
      agreeMarketing = value;
    });
  }

  void _syncAll() {
    setState(() {
      agreeAll = agreeService && agreePrivacy && agreeMarketing;
    });
  }

  bool get _canProceed => agreeService && agreePrivacy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '서비스 이용을 위해 이용약관 및 개인 정보 처리방침\n'
                '동의가 필요합니다. 동의 하시겠습니까?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              _AgreementTile(
                label: '전체 이용동의',
                value: agreeAll,
                onChanged: (value) => _toggleAll(value ?? false),
              ),
              const Divider(height: 24),
              _AgreementTile(
                label: '서비스 이용약관 동의 (필수)',
                value: agreeService,
                onChanged: (value) {
                  setState(() {
                    agreeService = value ?? false;
                  });
                  _syncAll();
                },
                onTap: () {
                  Navigator.pushNamed(context, TermsScreen.routeName);
                },
              ),
              _AgreementTile(
                label: '개인정보 처리방침 동의 (필수)',
                value: agreePrivacy,
                onChanged: (value) {
                  setState(() {
                    agreePrivacy = value ?? false;
                  });
                  _syncAll();
                },
                onTap: () {
                  Navigator.pushNamed(context, TermsScreen.routeName);
                },
              ),
              _AgreementTile(
                label: '마케팅 정보 수신동의 (선택)',
                value: agreeMarketing,
                onChanged: (value) {
                  setState(() {
                    agreeMarketing = value ?? false;
                  });
                  _syncAll();
                },
              ),
              const Spacer(),
              PrimaryButton(
                label: '동의하고 시작하기',
                onPressed: _canProceed
                    ? () {
                        Navigator.pushNamed(
                          context,
                          DbHomeScreen.routeName,
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgreementTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTap;

  const _AgreementTile({
    required this.label,
    required this.value,
    required this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
      title: Text(label),
      trailing: onTap == null
          ? null
          : IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.chevron_right),
            ),
      onTap: onTap,
    );
  }
}
