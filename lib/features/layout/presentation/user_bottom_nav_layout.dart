import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/layout/presentation/bottom_nav_bar_layout.dart';
import 'package:home4u/features/projects_filter/logic/ask_engineer/ask_engineer_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/ask_technical/ask_technical_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house_custom_package/renovate_house_custom_package_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/projects_filter_screen.dart';
import 'package:home4u/features/user/home/presentation/user_home_screen.dart';

import '../../../core/di/dependency_injection.dart';
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
