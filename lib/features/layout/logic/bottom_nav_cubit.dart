import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/presentation/profile_screen.dart';
import 'package:home4u/features/settings/presentation/setting_screen.dart';
import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit({
    required this.bottomNavIcons,
    required this.bottomNavScreens,
  }) : super(const BottomNavState.initial());

  static BottomNavCubit of(BuildContext context) =>
      BlocProvider.of<BottomNavCubit>(context);

  int currentIndex = 0;

  final List<IconData> bottomNavIcons;
  final List<Widget> bottomNavScreens;

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavState.changeBottomNavIndex(index));
  }
}
