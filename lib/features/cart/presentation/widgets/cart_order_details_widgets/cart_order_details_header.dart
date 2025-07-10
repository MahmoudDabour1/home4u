import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_back_button.dart';
import '../../../../../locale/app_locale.dart';

class CartOrderDetailsHeader extends StatelessWidget {
  const CartOrderDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBackButton(),
        const Spacer(),
        Text(
          AppLocale.myCart.getString(context),
          style: AppStyles.font20BlackMedium,
        ),
        const Spacer(),
      ],
    );
  }
}