import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/onboarding/data/model/onboarding_model.dart';
import 'package:home4u/features/onboarding/presentation/widgets/onboarding_item.dart';
import '../../../core/routing/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  bool _isOut = false;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      index = _pageController.page!.round();
    });
  }

  void _onNextPressed() {
    _animatePageTransition(() {
      if (index <= 3) {
        index++;
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onSkipPressed() {
    _animatePageTransition(() {
      index = 3;
      _pageController.jumpToPage(3);
    });
  }

  void _animatePageTransition(VoidCallback action) {
    setState(() {
      _isOut = true;
    });
    Timer(Duration(milliseconds: 210), () {
      setState(() {
        action();
        _isOut = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 24.0.w, left: 24.0.w, top: 18.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (newIndex) {
                    _animatePageTransition(() {
                      if (index <= 3) {
                        index++;
                      }
                    });
                  },
                  itemCount: onBoardingItems.length,
                  itemBuilder: (context, index) {
                    return OnboardingScrollItems(
                      index: index,
                      isOut: _isOut,
                      onSkipPressed: _onSkipPressed,
                      onNextPressed: _onNextPressed,
                      onPressedToSignUp: ()  async{
                        context.pushNameAndRemoveUntil(Routes.signUpScreen,
                            predicate: (Route<dynamic> route) => false);
                        await SharedPrefHelper.setData(SharedPrefKeys.isFirstTime, false);
                      },
                      onPressedToLogin: () async{
                        context.pushNameAndRemoveUntil(Routes.loginScreen,
                            predicate: (Route<dynamic> route) => false);
                        await SharedPrefHelper.setData(SharedPrefKeys.isFirstTime, false);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
