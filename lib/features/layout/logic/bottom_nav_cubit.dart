import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/presentation/profile_screen.dart';
import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState.initial());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavState.changeBottomNavIndex(index));
  }

  List<String> bottomNavItems = [
    'Home',
    'Projects',
    'Chats',
    'Community',
    'Profile',
  ];

  List<String> bottomNavItemsAR = [
    'الرئيسية',
    'المشاريع',
    'المحادثات',
    'المجتمع',
    'الملف الشخصي',
  ];

  List<IconData> bottomNavIcons = [
    CupertinoIcons.home,
    CupertinoIcons.square_stack_3d_up,
    CupertinoIcons.chat_bubble_2,
    CupertinoIcons.person_2,
    CupertinoIcons.profile_circled,
  ];

  List<Widget> bottomNavScreens = [
    ProfileScreen(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];
}
