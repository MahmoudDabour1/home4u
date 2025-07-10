import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_app_bar.dart';
import 'package:home4u/features/user/home/presentation/widgets/scroll_container_widget.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_filter_button.dart';
import '../../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';
import '../../../../locale/app_locale.dart';
import '../data/models/highest_rated_response_model.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';

class BestShowRoomsScreen extends StatefulWidget {
  const BestShowRoomsScreen({super.key});

  @override
  State<BestShowRoomsScreen> createState() => _BestShowRoomsScreenState();
}

class _BestShowRoomsScreenState extends State<BestShowRoomsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHighestRated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppCustomAppBar(title: AppLocale.theBestShowrooms.getString(context)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(32),
              Row(
                spacing: 16.w,
                children: [
                  Expanded(
                    child: AppCustomSearchTextField(
                      fillColor: AppColors.offWhiteColor,
                    ),
                  ),
                  AppCustomFilterButton(
                    onPressed: () {},
                    backgroundColor: AppColors.offWhiteColor,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  AppLocale.theBestShowrooms.getString(context),
                  style: AppStyles.font16BlackMedium,
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is GetHighestRatedLoading ||
                    current is GetHighestRatedHomeSuccess ||
                    current is GetHighestRatedHomeError,
                builder: (context, state) {
                  return state.maybeWhen(
                      getHighestRatedLoading: () => setupLoading(),
                      getHighestRatedSuccess: (data) => setupSuccess(data),
                      getHighestRatedError: (e) => setupError(e),
                      orElse: () => SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupSuccess(HighestRatedResponseModel data) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => verticalSpace(8.w),
        itemCount: data.data?.length ?? 0,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ScrollContainerWidget(
            isVerticalScroll: true,
            productId: data.data?[index].id ?? 0,
            image: data.data?[index].images?[0] ?? '',
            title: data.data?[index].name ?? '',
            starCount: data.data?[index].rate.toString() ?? '0',
            price: data.data?[index].price.toString() ?? "0",
            ratingCount: data.data?[index].countRates?.toString() ?? '0',
            rankBySales:
                "${data.data?[index].productRankBySales ?? 0} ${AppLocale.on.getString(context)} ${data.data?[index].categoryName ?? ""} category",
       numberOfSales: "${data.data?[index].numberOfSales} ${AppLocale.soldRecently.getString(context)}",
          );
        },
      ),
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Center(
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
