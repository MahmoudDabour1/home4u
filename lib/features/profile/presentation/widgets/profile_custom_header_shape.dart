import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_upper_buttons.dart';

import '../../../auth/widgets/custom_header_shape.dart';

class ProfileCustomHeaderShape extends StatelessWidget {
  const ProfileCustomHeaderShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomHeaderShape(
          isImage: true,
        ),
        ProfileUpperButtons(),
      ],
    );
  }
}
