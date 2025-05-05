import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';

import '../../../../../../core/widgets/app_custom_button.dart';
import '../../../../../../locale/app_locale.dart';

class FixedPackageBookingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FixedPackageBookingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        return AppCustomButton(
          isLoading: state is ChooseFixedPackageRenovateYourHouseLoading,
          textButton: AppLocale.bookPackage.getString(context),
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 50.h,
          onPressed: onPressed,
        );
      },
    );
  }
}
