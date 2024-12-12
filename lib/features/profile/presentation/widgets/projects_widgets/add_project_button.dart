import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class AddProjectButton extends StatelessWidget {
  const AddProjectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {},
        icon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              size: 25.r,
              color: AppColors.secondaryColor,
            ),
            horizontalSpace(10),
            Text("Add Project",style:AppStyles.font16DarkBlueLight,),
          ],
        ),
      ),
    );
  }
}
