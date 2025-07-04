import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/user/home/presentation/widgets/recommended_for_you/recommended_for_you_list_view.dart';

import '../../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/home_cubit.dart';
import '../custom_see_all_row_widget.dart';

class RecommendedForYouWidget extends StatefulWidget {
  const RecommendedForYouWidget({super.key});

  @override
  State<RecommendedForYouWidget> createState() => _RecommendedForYouWidgetState();
}

class _RecommendedForYouWidgetState extends State<RecommendedForYouWidget> {
  @override
  void initState() {
    super.initState();
    _loadUserIdAndFetchRecommendations();
  }

  void _loadUserIdAndFetchRecommendations() async {
    final userId = await SharedPrefHelper.getInt(SharedPrefKeys.userId);
    if (userId != null) {
      context.read<HomeCubit>().getRecommendedForYou(userId);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(32),
          CustomSeeAllRowWidget(
            text: AppLocale.recommendedForYou.getString(context),
            onPressed: () {
              context.pushNamed(Routes.recommendedForYouScreen);
            },
          ),
          verticalSpace(16),
          RecommendedForYouListView(),
          verticalSpace(32),
        ],
      ),
    );
  }
}
