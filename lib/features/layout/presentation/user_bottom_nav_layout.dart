import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/layout/presentation/bottom_nav_bar_layout.dart';
import 'package:home4u/features/projects_filter/presentation/projects_filter_screen.dart';
import 'package:home4u/features/user/home/presentation/user_home_screen.dart';

import '../../account/presentation/account_screen.dart';
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
  ProjectsFilterScreen(),
  Container(color: Colors.blue),
  AccountScreen(),
  SettingScreen(),
];
