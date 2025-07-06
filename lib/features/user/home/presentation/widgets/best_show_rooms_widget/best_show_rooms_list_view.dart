import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/home/data/models/highest_rated_response_model.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../scroll_container_widget.dart';

class BestShowRoomsListView extends StatelessWidget {
  const BestShowRoomsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is GetHighestRatedLoading ||
            current is GetHighestRatedHomeSuccess ||
            current is GetHighestRatedHomeError,
        builder: (context, state) {
          return state.maybeWhen(
              getHighestRatedLoading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              getHighestRatedSuccess: (data) {
                return setupSuccess(data);
              },
              getHighestRatedError: (e) => Center(
                    child: Text(
                      e.toString(),
                      style: TextStyle(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
              orElse: () => SizedBox.shrink());
        },
      ),
    );
  }

  Widget setupSuccess(HighestRatedResponseModel data) {
    return ListView.separated(
      separatorBuilder: (context, index) => horizontalSpace(8.w),
      itemCount: data.data?.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ScrollContainerWidget(
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
    );
  }
}
