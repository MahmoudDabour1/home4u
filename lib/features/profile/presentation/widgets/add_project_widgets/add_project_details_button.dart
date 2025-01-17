import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';

import '../../../../../locale/app_locale.dart';

class AddProjectDetailsButton extends StatelessWidget {
  const AddProjectDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomButton(
      textButton: AppLocale.confirm.getString(context),
      btnWidth: MediaQuery.sizeOf(context).width,
      btnHeight: 65.h,
      onPressed: () {},
    );
  }
}
