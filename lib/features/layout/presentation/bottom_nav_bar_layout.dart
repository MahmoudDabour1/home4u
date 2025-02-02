import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:home4u/features/layout/logic/bottom_nav_cubit.dart';
import 'package:home4u/features/layout/logic/bottom_nav_state.dart';

import '../../../core/localization/app_localization_cubit.dart';
import '../../../locale/app_locale.dart';

class BottomNavBarLayout extends StatelessWidget {
  const BottomNavBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final bottomNavCubit = BlocProvider.of<BottomNavCubit>(context);

        return Scaffold(
          bottomNavigationBar: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0.w,
                    vertical: 8.h,
                  ),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: Colors.black,
                    tabs: List.generate(
                      bottomNavCubit.bottomNavScreens.length,
                      (index) => GButton(
                        icon: bottomNavCubit.bottomNavIcons[index],
                        text: context.read<AppLocalizationCubit>().appLocale ==
                                AppLocale.en
                            ? AppLocale.bottomNavItems[index]
                            : AppLocale.bottomNavItemsAR[index],
                      ),
                    ),
                    selectedIndex: bottomNavCubit.currentIndex,
                    onTabChange: (value) {
                      bottomNavCubit.changeBottomNavIndex(value);
                    },
                  ),
                ),
              ),
            ),
          ),
          body: IndexedStack(
            index: bottomNavCubit.currentIndex,
            children: bottomNavCubit.bottomNavScreens,
          ),
        );
      },
    );
  }
}
