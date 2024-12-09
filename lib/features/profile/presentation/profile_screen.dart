import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_upper_widget.dart';
import 'package:home4u/features/profile/presentation/widgets/tap_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileUpperWidget(),
            Expanded(child: TapBarWidget()),
          ],
        ),
      ),
    );
  }
}
