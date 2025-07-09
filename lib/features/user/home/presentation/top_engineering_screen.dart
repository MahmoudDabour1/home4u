import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/home/data/models/top_engineers_response_model.dart';
import 'package:home4u/features/user/home/logic/home_cubit.dart';
import 'package:home4u/features/user/home/presentation/widgets/top_engineers/tops_single_item.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_app_bar.dart';
import '../../../../core/widgets/app_custom_filter_button.dart';
import '../../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';
import '../../../../locale/app_locale.dart';
import '../logic/home_state.dart';

class TopEngineeringScreen extends StatefulWidget {
  const TopEngineeringScreen({super.key});

  @override
  State<TopEngineeringScreen> createState() => _TopEngineeringScreenState();
}

class _TopEngineeringScreenState extends State<TopEngineeringScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopEngineers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppCustomAppBar(title: AppLocale.topEngineers.getString(context)),
      body:  SafeArea(
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
                  AppLocale.topEngineers.getString(context),
                  style: AppStyles.font16BlackMedium,
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                current is GetTopEngineersLoading ||
                    current is GetTopEngineersSuccess ||
                    current is GetTopEngineersError,
                builder: (context, state) {
                  return state.maybeWhen(
                      geTopEngineersLoading: () => setupLoading(),
                      getTopEngineersSuccess: (data) => setupSuccess(data),
                      getTopEngineersError: (e) => setupError(e),
                      orElse: () => SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget setupSuccess(TopEngineersResponseModel data) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => verticalSpace(8.w),
        itemCount: data.data?.length ?? 0,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final userData = data.data?[index];
          return TopsSingleItem(
            firstName: userData?.user?.firstName ?? '',
            lastName: userData?.user?.lastName ?? '',
            image: userData?.user?.personalPhoto ?? '',
            bio: userData?.bio ?? '',
            email: userData?.user?.email ?? '',
            phone: userData?.user?.phone ?? '',
            userId: userData?.user?.id ?? 0,
            yearsOfExperience: userData?.yearsOfExperience ?? 0,
            governorate: userData?.user?.governorate?.name ?? '',
            city: userData?.user?.city?.name ?? '',
            type: userData?.type?.name ?? '',
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
