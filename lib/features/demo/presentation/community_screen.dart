import 'package:flutter/material.dart';

import '../../../core/theming/app_assets.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child:  Image.asset(
          AppAssets.comingSoonOneJpg,
          fit: BoxFit.contain,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
    );
  }
}
