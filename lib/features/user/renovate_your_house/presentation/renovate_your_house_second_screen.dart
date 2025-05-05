import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/features/user/renovate_your_house/presentation/widgets/renovate_tab_bar/renovate_tab_bar.dart';
import 'package:home4u/features/user/renovate_your_house/presentation/widgets/renovate_tab_bar/renovate_tab_bar_view_body.dart';

import '../../../../locale/app_locale.dart';

class RenovateYourHouseSecondScreen extends StatelessWidget {
  const RenovateYourHouseSecondScreen({super.key});

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
                    headText: AppLocale.renovateYourHouse.getString(context),
                    subText: '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(16)),
                RenovateTabBar(),
              ];
            },
            body: RenovateTabBarViewBody(),
          ),
        ),
      ),
    );
  }
}
