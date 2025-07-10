import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_add_button.dart';
import '../../../../../locale/app_locale.dart';

class AddOfferAskTechnicalButton extends StatefulWidget {
  final num? requestCount;
  final int askId;

  const AddOfferAskTechnicalButton({
    super.key,
    this.requestCount,
    required this.askId,
  });

  @override
  State<AddOfferAskTechnicalButton> createState() =>
      _AddOfferAskTechnicalButtonState();
}

class _AddOfferAskTechnicalButtonState
    extends State<AddOfferAskTechnicalButton> {
  String? _userType;

  @override
  void initState() {
    super.initState();
    _fetchUserType();
  }

  Future<void> _fetchUserType() async {
    final userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);
    setState(() => _userType = userType);
  }

  bool get _canAddOffer {
    return _userType == "TECHNICAL_WORKER";
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.requestCount != 0)
          Text(
            "${AppLocale.offersCount.getString(context)} (${widget.requestCount ?? 0})",
            style: AppStyles.font16BlackMedium,
          ),
        const Spacer(),
        if (_canAddOffer) _buildAddButton(context),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return AppCustomAddButton(
      text: AppLocale.addOffer.getString(context),
      onPressed: () {
        context.pushNamed(
          Routes.addOfferAskTechnicalScreen,
          arguments: widget.askId,
        );
      },
    );
  }
}
