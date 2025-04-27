import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/presentation/widgets/about_widgets/about_title_and_edit_row.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import 'about_web_custom_item_widget.dart';

class AboutWebIconsWidget extends StatelessWidget {
  final EngineerProfileResponseModel? engineerProfileResponseModel;
  final TechnicalWorkerResponseModel? technicalWorkerProfileData;
  final EngineeringOfficeProfileResponseModel? engineeringOfficeProfileData;

  const AboutWebIconsWidget({
    super.key,
    this.engineerProfileResponseModel,
    this.technicalWorkerProfileData,
    this.engineeringOfficeProfileData,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileData = engineerProfileResponseModel?.data ??
        technicalWorkerProfileData?.data ??
        engineeringOfficeProfileData?.data;

    return Column(
      children: [
        AboutTitleAndEditRow(
          onPressed: () {},
          title: "On the web",
        ),
        verticalSpace(16),
        Row(
          children: [
            AboutWebCustomItemWidget(
              iconPath: AppAssets.whatsappSvg,
              onTap: () {
                _launchUrl('https://wa.me/${(profileData as dynamic)?.user.phone ?? ""}');
              },
            ),
            AboutWebCustomItemWidget(
              iconPath: AppAssets.facebookIcon,
              onTap: () {
                _launchUrl((profileData as dynamic)?.user.phone ?? 'https://facebook.com');
              },
            ),
            AboutWebCustomItemWidget(
              iconPath: AppAssets.instagramIcon,
              onTap: () {
                _launchUrl((profileData as dynamic)?.user.phone ?? 'https://instagram.com');
              },
            ),
            AboutWebCustomItemWidget(
              iconPath: AppAssets.behanceSvg,
              onTap: () {
                _launchUrl((profileData as dynamic)?.behance ?? 'https://www.behance.net');
              },
            ),
          ],
        ),
        verticalSpace(16),
      ],
    );
  }
}
