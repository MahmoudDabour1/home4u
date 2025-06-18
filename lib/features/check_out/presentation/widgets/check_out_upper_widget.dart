import 'package:flutter/cupertino.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';

import 'location_and_done_shape.dart';

class CheckOutUpperWidget extends StatelessWidget {
  const CheckOutUpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocationAndDoneShape(),
        Text(
          "STEP 1",
          style: AppStyles.font14BlackLight,
        ),
        Text(
          "Shipping",
          style: AppStyles.font24BlackBold,
        ),
        verticalSpace(37),
      ],
    );
  }
}
