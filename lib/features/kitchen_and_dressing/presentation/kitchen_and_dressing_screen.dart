import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/kitchen_and_dressing/presentation/dressing_section.dart';
import 'package:home4u/features/kitchen_and_dressing/presentation/kitchen_section.dart';
import 'package:home4u/features/kitchen_and_dressing/presentation/widgets/kitchen_and_dressing_tab_bar.dart';

import '../../../core/utils/spacing.dart';
import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class KitchenAndDressingScreen extends StatelessWidget {
  const KitchenAndDressingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: AuthWelcomeData(
                    headText: AppLocale.kitchensAndDressing.getString(context),
                    subText: '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(16)),
                KitchenAndDressingTabBar(),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).h,
              child: TabBarView(
                children: [
                  DressingSection(),
                  KitchenSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
