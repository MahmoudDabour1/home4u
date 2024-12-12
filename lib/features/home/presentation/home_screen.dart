import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "HomeScreen",
              style: AppStyles.font16DarkBlueBold,
            ),
          ),
        ],
      ),
    );
  }
}
