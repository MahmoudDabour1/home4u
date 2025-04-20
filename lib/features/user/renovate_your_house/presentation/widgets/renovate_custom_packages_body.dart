import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../logic/renovate_your_house_cubit.dart';
import 'custom_packages/renovate_custom_package_confirm_button.dart';
import 'custom_packages/renovate_custom_package_inputs.dart';
import 'custom_packages/renovate_custom_packages_drop_down_buttons.dart';

class RenovateCustomPackagesBody extends StatelessWidget {
  const RenovateCustomPackagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RenovateCustomPackagesDropDownButtons(),
          verticalSpace(16),
          RenovateCustomPackageInputs(),
          verticalSpace(32),
          RenovateCustomPackageConfirmButton(),
          verticalSpace(32),
        ],
      ),
    );
  }
}
