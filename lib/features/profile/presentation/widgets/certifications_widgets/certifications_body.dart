import 'package:flutter/widgets.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certifications_bloc_builder.dart';

import '../../../../../core/widgets/app_custom_add_button.dart';
import '../../../../../locale/app_locale.dart';

class CertificationsBody extends StatelessWidget {
  const CertificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomAddButton(
          text: AppLocale.addCertifications.getString(context),
          onPressed: () {
            context.pushNamed(Routes.addCertificationScreen);
          },
        ),
        CertificationsBlocBuilder(),
      ],
    );
  }
}
