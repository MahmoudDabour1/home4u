import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/renovate_your_house/presentation/widgets/renovate_fixed_packages_body.dart';

import '../renovate_custom_packages_body.dart';

class RenovateTabBarViewBody extends StatelessWidget {
  const RenovateTabBarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).h,
      child: TabBarView(
        children: [
          RenovateCustomPackagesBody(),
          RenovateFixedPackagesBody(),
        ],
      ),
    );
  }
}
