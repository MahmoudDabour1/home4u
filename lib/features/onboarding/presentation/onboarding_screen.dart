import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
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
    if (index <= 3) {
      index++;
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkipPressed() {
    index = 3;
    _pageController.jumpToPage(3);
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
                    if (index <= 3) {
                      index++;
                    }
                  },
                  itemCount: onBoardingItems.length,
                  itemBuilder: (context, index) {
                    return OnboardingScrollItems(
                      index: index,
                      onSkipPressed: _onSkipPressed,
                      onNextPressed: _onNextPressed,
                      onPressedToSignUp: () {
                        context.pushNameAndRemoveUntil(
                          Routes.signUpScreen,
                          predicate: (Route<dynamic> route) => false,
                        );
                      },
                      onPressedToLogin: () {
                        context.pushNameAndRemoveUntil(
                          Routes.loginScreen,
                          predicate: (Route<dynamic> route) => false,
                        );
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
