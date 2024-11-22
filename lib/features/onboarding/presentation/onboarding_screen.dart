import 'dart:async';

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
    setState(() {
      _isOut = true;
    });
    Timer(Duration(milliseconds: 210), () {
      setState(() {
        if (index < 3) {
          index++;
          _isOut = false;
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });
    });
    if (index == 3) {
      context.pushNameAndRemoveUntil(Routes.loginScreen,
          predicate: (Route<dynamic> route) => false);
    }
  }

  void _onSkipPressed() {
    context.pushNameAndRemoveUntil(Routes.loginScreen,
        predicate: (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (newIndex) {
                    setState(() {
                      _isOut = true;
                    });
                    Timer(Duration(milliseconds: 210), () {
                      setState(() {
                        if (index <= 3) {
                          index++;
                          _isOut = false;
                        }
                      });
                    });
                  },
                  itemCount: onBoardingItems.length,
                  itemBuilder: (context, index) {
                    return OnboardingScrollItems(
                      index: index,
                      isOut: _isOut,
                      onStartPressed: _onNextPressed,
                      onSkipPressed: _onSkipPressed,
                      onNextPressed: _onNextPressed,
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
