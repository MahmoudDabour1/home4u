import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/home/data/models/top_engineers_response_model.dart';
import 'package:home4u/features/user/home/presentation/widgets/top_engineers/tops_single_item.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../scroll_container_widget.dart';

class TopEngineersListView extends StatelessWidget {
  const TopEngineersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetTopEngineersLoading ||
          current is GetTopEngineersSuccess ||
          current is GetTopEngineersError,
      builder: (context, state) {
        return state.maybeWhen(
            geTopEngineersLoading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            getTopEngineersSuccess: (data) {
              return setupSuccess(data);
            },
            getTopEngineersError: (e) => Center(
                  child: Text(
                    e.toString(),
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  ),
                ),
            orElse: () => SizedBox.shrink());
      },
    );
  }
  Widget setupSuccess(TopEngineersResponseModel data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          data.data?.length ?? 0,
              (index) {
            final userData = data.data![index];
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: TopsSingleItem(
                firstName: userData.user?.firstName ?? '',
                lastName: userData.user?.lastName ?? '',
                image: userData.user?.personalPhoto ?? '',
                bio: userData.bio ?? '',
                email: userData.user?.email ?? '',
                phone: userData.user?.phone ?? '',
                userId: userData.user?.id ?? 0,
                yearsOfExperience: userData.yearsOfExperience ?? 0,
                governorate: userData.user?.governorate?.name ?? '',
                city: userData.user?.city?.name ?? '',
                type: userData.type?.name ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
  // Widget setupSuccess(TopEngineersResponseModel data) {
  //   return ListView.separated(
  //     separatorBuilder: (context, index) => horizontalSpace(8.w),
  //     itemCount: data.data?.length ?? 0,
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder: (context, index) {
  //       final userData = data.data?[index];
  //       return TopsSingleItem(
  //         firstName: userData?.user?.firstName ?? '',
  //         lastName: userData?.user?.lastName ?? '',
  //         image: userData?.user?.personalPhoto ?? '',
  //         bio: userData?.bio ?? '',
  //         email: userData?.user?.email ?? '',
  //         phone: userData?.user?.phone ?? '',
  //         userId: userData?.user?.id ?? 0,
  //         yearsOfExperience: userData?.yearsOfExperience ?? 0,
  //         governorate: userData?.user?.governorate?.name ?? '',
  //         city: userData?.user?.city?.name ?? '',
  //       );
  //     },
  //   );
  // }
}
