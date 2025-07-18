import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/home/data/models/recommended_for_you_response_model.dart';

import '../../../../../../locale/app_locale.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../scroll_container_widget.dart';

class RecommendedForYouListView extends StatelessWidget {
  const RecommendedForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetRecommendedForYouLoading ||
          current is GetRecommendedForYouHomeSuccess ||
          current is GetRecommendedForYouHomeError,
      builder: (context, state) {
        return state.maybeWhen(
            getRecommendedForYouLoading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            getRecommendedForYouSuccess: (data) {
              return setupSuccess(data,context);
            },
            getRecommendedForYouError: (e) => Center(
                  child: Text(
                    e.toString(),
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  ),
                ),
            orElse: () => SizedBox.shrink());
      },
    );
  }

  Widget setupSuccess(RecommendedForYouResponseModel data,BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
           data.data?.length ?? 0,
              (index) {
            return Padding(
              padding:  EdgeInsets.only(right: 8.w),
              child: ScrollContainerWidget(
                productId: data.data?[index].id ?? 0,
                image: data.data?[index].images?[0] ?? '',
                title: data.data?[index].name ?? '',
                starCount: data.data?[index].rate.toString() ?? '0',
                price: data.data?[index].price.toString() ?? "0",
                ratingCount: data.data?[index].countRates?.toString() ?? '0',
                rankBySales:
                "${data.data?[index].productRankBySales ?? 0} ${AppLocale.on.getString(context)} ${data.data?[index].categoryName ?? ""} category",
                numberOfSales: "${data.data?[index].numberOfSales} ${AppLocale.soldRecently.getString(context)}",
              ),
            );
          },
        ),
      ),
    );


    // return ListView.separated(
    //   shrinkWrap: true,
    //   physics: BouncingScrollPhysics(),
    //   separatorBuilder: (context, index) => horizontalSpace(8.w),
    //   itemCount: data.data?.length ?? 0,
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (context, index) {
    //     return ScrollContainerWidget(
    //       productId: data.data?[index].id ?? 0,
    //       image: data.data?[index].images?[0] ?? '',
    //       title: data.data?[index].name ?? '',
    //       starCount: data.data?[index].rate.toString() ?? '0',
    //       price: data.data?[index].price.toString() ?? "0",
    //       ratingCount: data.data?[index].countRates?.toString() ?? '0',
    //       rankBySales:
    //           "${data.data?[index].productRankBySales ?? 0} ${AppLocale.on.getString(context)} ${data.data?[index].categoryName ?? ""} category",
    //
    //       numberOfSales: "${data.data?[index].numberOfSales} ${AppLocale.soldRecently.getString(context)}",
    //     );
    //   },
    // );
  }
}
