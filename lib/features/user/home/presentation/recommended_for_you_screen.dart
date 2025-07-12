import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_loading_indicator.dart';
import 'package:home4u/features/user/home/presentation/widgets/scroll_container_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_app_bar.dart';
import '../../../../core/widgets/app_custom_filter_button.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';
import '../data/models/recommended_for_you_response_model.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';

class RecommendedForYouScreen extends StatefulWidget {
  const RecommendedForYouScreen({super.key});

  @override
  State<RecommendedForYouScreen> createState() =>
      _RecommendedForYouScreenState();
}

class _RecommendedForYouScreenState extends State<RecommendedForYouScreen> {
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
    return Scaffold(
      appBar: AppCustomAppBar(
        title: AppLocale.recommendedForYou.getString(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              // Row(
              //   spacing: 16.w,
              //   children: [
              //     Expanded(
              //       child: AppCustomSearchTextField(
              //         fillColor: AppColors.offWhiteColor,
              //       ),
              //     ),
              //     AppCustomFilterButton(
              //       onPressed: () {},
              //       backgroundColor: AppColors.offWhiteColor,
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.h),
              //   child: Text(
              //     AppLocale.recommendedForYou.getString(context),
              //     style: AppStyles.font16BlackMedium,
              //   ),
              // ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is GetRecommendedForYouLoading ||
                    current is GetRecommendedForYouHomeSuccess ||
                    current is GetRecommendedForYouHomeError,
                builder: (context, state) {
                  return state.maybeWhen(
                      getRecommendedForYouLoading: () => setupLoading(),
                      getRecommendedForYouSuccess: (data) => setupSuccess(data),
                      getRecommendedForYouError: (e) => setupError(e),
                      orElse: () => SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupSuccess(RecommendedForYouResponseModel data) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => verticalSpace(8.w),
        itemCount: data.data?.length ?? 0,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ScrollContainerWidget(
            product: data.data?[index],
            isVerticalScroll: true,
            productId: data.data?[index].id ?? 0,
            image: data.data?[index].images?[0] ?? '',
            title: data.data?[index].name ?? '',
            starCount: data.data?[index].rate.toString() ?? '0',
            price: data.data?[index].price.toString() ?? "0",
            ratingCount: data.data?[index].countRates?.toString() ?? '0',
            rankBySales:
                "${data.data?[index].productRankBySales ?? 0} ${AppLocale.on.getString(context)} ${data.data?[index].categoryName ?? ""} category",
            numberOfSales:
                "${data.data?[index].numberOfSales} ${AppLocale.soldRecently.getString(context)}",
          );
        },
      ),
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: const Center(
        child: AppCustomLoadingIndicator(),
      ),
    );
  }

  Widget setupError(String e) {
    return Center(
      child: Text(
        e.toString(),
        style: TextStyle(fontSize: 16.sp, color: Colors.red),
      ),
    );
  }
}
