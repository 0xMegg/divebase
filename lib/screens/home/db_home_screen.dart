import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/section_card.dart';
import '../my/my_page_screen.dart';

class DbHomeScreen extends StatelessWidget {
  static const routeName = '/db-home';

  const DbHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DB 홈'),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, MyPageScreen.routeName);
          }
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total DB',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _StatItem(
                      label: 'Times',
                      value: '10',
                    ),
                    const SizedBox(width: 12),
                    _StatItem(
                      label: 'Meters',
                      value: '20 M',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '다이빙 로그',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          _LogTile(
            title: 'Jeju Island',
            subtitle: '2026-01-02 · 30 Min.',
          ),
          _LogTile(
            title: 'Semporna',
            subtitle: '2026-01-02 · 30 Min.',
          ),
          _LogTile(
            title: 'Semporna',
            subtitle: '2026-01-02 · 30 Min.',
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F4F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 6),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _LogTile({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
