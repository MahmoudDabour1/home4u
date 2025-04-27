import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_assets.dart';

import '../../../../../core/widgets/app_custom_menu_and_dialog.dart';

class AboutCustomMenuAndDialog extends StatelessWidget {
  final VoidCallback? onEdit;
  const AboutCustomMenuAndDialog({super.key, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return AppCustomMenuAndDialog(
      icon: AppAssets.menuBlackImageSvg,
      deleteWidget: Text(""),
      onEdit: onEdit,
    );
  }
}
