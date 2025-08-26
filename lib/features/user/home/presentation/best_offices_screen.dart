import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_app_bar.dart';
import 'package:home4u/core/widgets/app_custom_filter_button.dart';
import 'package:home4u/features/user/home/presentation/widgets/scroll_container_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';
import '../data/models/top_best_seller_response_model.dart';
import '../logic/home_cubit.dart';
import '../logic/home_state.dart';

class BestOfficesScreen extends StatefulWidget {
  const BestOfficesScreen({super.key});

  @override
  State<BestOfficesScreen> createState() => _BestOfficesScreenState();
}

class _BestOfficesScreenState extends State<BestOfficesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopBestSeller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppCustomAppBar(title: AppLocale.topBestSeller.getString(context)),
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
              //     AppLocale.topBestSeller.getString(context),
              //     style: AppStyles.font16BlackMedium,
              //   ),
              // ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is GetTopBestSellerLoading ||
                    current is GetTopBestSellerHomeSuccess ||
                    current is GetTopBestSellerHomeError,
                builder: (context, state) {
                  return state.maybeWhen(
                      getTopBestSellerLoading: () => setupLoading(),
                      getTopBestSellerSuccess: (data) => setupSuccess(data),
                      getTopBestSellerError: (e) => setupError(e),
                      orElse: () => SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupSuccess(TopBestSellerResponseModel data) {
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
