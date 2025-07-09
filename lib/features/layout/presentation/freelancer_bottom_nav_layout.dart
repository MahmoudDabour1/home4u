import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../profile/presentation/profile_screen.dart';
import '../../projects_filter/presentation/projects_filter_screen.dart';
import '../../settings/presentation/setting_screen.dart';
import 'bottom_nav_bar_layout.dart';

class FreelancerBottomNavLayout extends StatelessWidget {
  const FreelancerBottomNavLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavBarLayout(
      icons: bottomNavIcons,
      screens: bottomNavScreens,
    );
  }
}

List<IconData> bottomNavIcons = [
  CupertinoIcons.home,
  CupertinoIcons.square_stack_3d_up,
  CupertinoIcons.chat_bubble_2,
  CupertinoIcons.person_2,
  CupertinoIcons.profile_circled,
];

List<Widget> bottomNavScreens = [
  ProfileScreen(),
  ProjectsFilterScreen(),
  Container(color: Colors.blue),
  Container(color: Colors.yellow),
  SettingScreen(),
];
