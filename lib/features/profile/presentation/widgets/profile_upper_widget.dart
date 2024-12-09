import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_custom_header_shape.dart';
import 'package:home4u/features/profile/presentation/widgets/user_image_widget.dart';

import '../../../../core/theming/app_colors.dart';
import 'information_widget.dart';

class ProfileUpperWidget extends StatelessWidget {
  const ProfileUpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ProfileCustomHeaderShape(),
            InformationWidget(),
            UserImageWidget(),
          ],
        ),
        Divider(
          thickness: 2,
          color: AppColors.grayColor,
        ),
      ],
    );
  }
}
