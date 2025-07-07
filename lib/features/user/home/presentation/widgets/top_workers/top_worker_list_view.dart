import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/home/data/models/top_workers_response_model.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../top_engineers/tops_single_item.dart';

class TopWorkerListView extends StatelessWidget {
  const TopWorkerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
      current is GetTopWorkersLoading ||
          current is GetTopWorkersSuccess ||
          current is GetTopWorkersError,
      builder: (context, state) {
        return state.maybeWhen(
            geTopWorkersLoading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            getTopWorkersSuccess: (data) {
              return setupSuccess(data);
            },
            getTopWorkersError: (e) => Center(
              child: Text(
                e.toString(),
                style: TextStyle(fontSize: 16.sp, color: Colors.red),
              ),
            ),
            orElse: () => SizedBox.shrink());
      },
    );
  }

  Widget setupSuccess(TopWorkersResponseModel data) {
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
}
