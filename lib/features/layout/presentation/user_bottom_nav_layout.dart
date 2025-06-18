import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/layout/presentation/bottom_nav_bar_layout.dart';
import 'package:home4u/features/user/home/presentation/user_home_screen.dart';

import '../../settings/presentation/setting_screen.dart';

class UserBottomNavLayout extends StatelessWidget {
  const UserBottomNavLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavBarLayout(
      icons: _bottomNavIcons,
      screens: _bottomNavScreens,
    );
  }
}

List<IconData> _bottomNavIcons = [
  CupertinoIcons.home,
  CupertinoIcons.square_stack_3d_up,
  CupertinoIcons.chat_bubble_2,
  CupertinoIcons.person_2,
  CupertinoIcons.profile_circled,
];

List<Widget> _bottomNavScreens = [
  UserHomeScreen(),
  Container(color: Colors.green),
  Container(color: Colors.blue),
  Container(color: Colors.yellow),
  SettingScreen(),
];
