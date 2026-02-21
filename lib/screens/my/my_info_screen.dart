import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';
import '../../widgets/section_card.dart';

class MyInfoScreen extends StatelessWidget {
  static const routeName = '/my-info';

  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('다이빙정보'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Scuba Diving'),
              Tab(text: 'Freediving'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _DiveInfoForm(typeLabel: '스쿠버 다이빙'),
            _DiveInfoForm(typeLabel: '프리 다이빙'),
          ],
        ),
      ),
    );
  }
}

class _DiveInfoForm extends StatelessWidget {
  final String typeLabel;

  const _DiveInfoForm({required this.typeLabel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                typeLabel,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              _OptionRow(
                title: '라이센스 소유여부',
                options: const ['예', '아니오'],
              ),
              const SizedBox(height: 16),
              _FieldTile(
                label: '라이센스 발급처',
                hint: '라이센스 발급처 선택하세요.',
              ),
              const SizedBox(height: 12),
              _FieldTile(
                label: '라이센스 등급',
                hint: '라이센스 등급 선택하세요.',
              ),
              const SizedBox(height: 12),
              _OptionRow(
                title: '강사여부',
                options: const ['예', '아니오'],
              ),
              const SizedBox(height: 16),
              _FieldTile(
                label: '다이빙 횟수',
                hint: '0 회',
              ),
            ],
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
                label: '저장',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FieldTile extends StatelessWidget {
  final String label;
  final String hint;

  const _FieldTile({
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }
}

class _OptionRow extends StatelessWidget {
  final String title;
  final List<String> options;

  const _OptionRow({
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: options
              .map(
                (option) => OutlinedButton(
                  onPressed: () {},
                  child: Text(option),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
