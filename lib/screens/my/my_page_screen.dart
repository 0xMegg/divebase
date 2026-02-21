import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';
import '../../widgets/section_card.dart';
import '../home/db_home_screen.dart';
import 'my_info_screen.dart';

class MyPageScreen extends StatelessWidget {
  static const routeName = '/my';

  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, DbHomeScreen.routeName);
          }
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SectionCard(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFF0E6E8D),
                  child: Text(
                    'DB',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dive Base',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Google | divebase.me@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  title: const Text('다이빙 정보추가'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushNamed(context, MyInfoScreen.routeName);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  title: const Text('로그아웃'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
