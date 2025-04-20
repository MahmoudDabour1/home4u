import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/user/request_design/presentation/widgets/request_design_tab_bar.dart';
import 'package:home4u/features/user/request_design/presentation/widgets/request_design_tab_bar_view_body.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';
import '../../../auth/widgets/auth_welcome_data.dart';

class RequestDesignScreen extends StatelessWidget {
  const RequestDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: AuthWelcomeData(
                    headText: AppLocale.requestDesign.getString(context),
                    subText: '',
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(16)),
                RequestDesignTabBar(),
              ];
            },
            body: RequestDesignTabBarViewBody(),
          ),
        ),
      ),
    );
  }
}
