import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/data/models/profile/get_engineer_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_rating_widget.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_custom_button.dart';
import '../../../../locale/app_locale.dart';

class InformationWidget extends StatelessWidget {
  final GetEngineerResponseModel engineerData;
  const InformationWidget({super.key, required this.engineerData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(200),
          Text(
            "${engineerData.data!.user!.firstName}${engineerData.data!.user!.lastName}" ??"Mahmoud Dabour",
            style: AppStyles.font16BlackSemiBold,
          ),
          verticalSpace(8),
          Text(
            engineerData.data!.type!.name!,
            style: AppStyles.font16BlackLight,
          ),
          verticalSpace(8),
          ProfileRatingWidget(),
          verticalSpace(8),
          Text(
            engineerData.data!.bio!,
            style: AppStyles.font16BlackLight,
            textAlign: TextAlign.center,
          ),
          verticalSpace(8),
          AppCustomButton(
            textButton: AppLocale.editProfile.getString(context),
            btnWidth: 200.w,
            btnHeight: 30.h,
            onPressed: () {},
            radius: 25,
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
