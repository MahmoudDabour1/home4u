import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import 'apply_promo_code_button.dart';

class PromoCodeInput extends StatelessWidget {
  const PromoCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: AppTextFormField(
            labelText: "Enter your promo code",
            validator: (p0) {},
          ),
        ),
        horizontalSpace(16.w),
        const ApplyPromoCodeButton(),
      ],
    );
  }
}
