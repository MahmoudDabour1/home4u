import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/profile/presentation/widgets/about_widgets/about_title_and_edit_row.dart';
import 'package:home4u/locale/app_locale.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../logic/profile/profile_cubit.dart';
import 'about_alert_dialog.dart';
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
  dynamic get _profileData =>
      engineerProfileResponseModel?.data ??
          technicalWorkerProfileData?.data ??
          engineeringOfficeProfileData?.data;

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    return Column(
      children: [
        AboutTitleAndEditRow(
          onPressed: () => _showWebDialog(context, cubit, false),
          title: AppLocale.onTheWeb.getString(context),
        ),
        verticalSpace(16),
        Row(
          children: [
            if (_profileData?.user?.phone != null)
              _buildSocialIcon(
                iconPath: AppAssets.whatsappSvg,
                url: 'https://wa.me/${_profileData.user.phone}',
              ),
            if (_isValidLink(_profileData?.facebookLink))
              _buildSocialIcon(
                iconPath: AppAssets.facebookIcon,
                url: _profileData.facebookLink,
              ),
            if (_isValidLink(_profileData?.linkedin))
              _buildSocialIcon(
                iconPath: AppAssets.linkedinIconSvg,
                url: _profileData.linkedin,
              ),
            if (_isValidLink(_profileData?.behance))
              _buildSocialIcon(
                iconPath: AppAssets.behanceSvg,
                url: _profileData.behance,
              ),
          ],
        ),
        verticalSpace(16),
      ],
    );
  }

  Widget _buildSocialIcon({required String iconPath, required String url}) {
    return AboutWebCustomItemWidget(
      iconPath: iconPath,
      onTap: () => _launchUrl(url),
    );
  }

  bool _isValidLink(String? link) {
    return link != null && link.isNotEmpty;
  }

  void _showWebDialog(
      BuildContext context, ProfileCubit cubit, bool isLoading) {
    final profileData = engineerProfileResponseModel?.data ??
        technicalWorkerProfileData?.data ??
        engineeringOfficeProfileData?.data;

    cubit.facebookController.text =
        (profileData as dynamic)?.facebookLink ?? '';
    cubit.linkedinController.text = (profileData as dynamic)?.linkedin ?? '';
    cubit.behanceController.text = (profileData as dynamic)?.behance ?? '';

    showDialog(
      context: context,
      builder: (context) => AboutAlertDialog(
        title: AppLocale.editLink.getString(context),
        onEditPress: () async {
          final userType =
              await SharedPrefHelper.getString(SharedPrefKeys.userType);
          if (userType == "TECHNICAL_WORKER") {
            cubit.updateTechnicalWorkerProfileData(context);
          } else if (userType == "ENGINEERING_OFFICE") {
            cubit.updateEngineeringOfficeProfileData(context);
          } else if (userType == "ENGINEER") {
            cubit.updateEngineerProfileData(context);
          }
        },
        alertContent: Column(
          children: [
            AppTextFormField(
                controller: cubit.facebookController,
                labelText: AppLocale.facebookLink.getString(context),
                validator: (value) {}),
            verticalSpace(8),
            AppTextFormField(
                controller: cubit.linkedinController,
                labelText: AppLocale.linkedInLink.getString(context),
                validator: (value) {}),
            verticalSpace(8),
            AppTextFormField(
                controller: cubit.behanceController,
                labelText: AppLocale.behanceLink.getString(context),
                validator: (value) {}),
            verticalSpace(8),
          ],
        ),
      ),
    );
  }
}
