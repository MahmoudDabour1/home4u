import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../logic/renovate_your_house_cubit.dart';
import '../../../logic/renovate_your_house_state.dart';

class RenovateCustomPackageConfirmButton extends StatelessWidget {
  const RenovateCustomPackageConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RenovateYourHouseCubit>();
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        return AppCustomButton(
          isLoading: state is AddCustomPackageRenovateYourHouseLoading,
          textButton: AppLocale.confirm.getString(context),
          btnWidth: MediaQuery.sizeOf(context).width,
          btnHeight: 50.h,
          onPressed: () async {
            if (cubit.validationKey.currentState!.validate()) {
              cubit.addCustomPackageRenovateYourHouse(
                cubit.prepareCustomPackageBody(),
              );
            }
          },
        );
      },
    );
  }
}
