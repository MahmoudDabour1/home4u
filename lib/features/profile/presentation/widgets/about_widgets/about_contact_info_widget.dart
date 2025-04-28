import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/theming/font_weight_helper.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_add_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/profile/presentation/widgets/about_widgets/about_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../../auth/sign_up/logic/sign_up_state.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../logic/profile/profile_cubit.dart';
import '../../../logic/profile/profile_state.dart';
import 'about_list_tile_item_widget.dart';

class AboutContactInfoWidget extends StatefulWidget {
  final EngineerProfileResponseModel? engineerProfileResponseModel;
  final TechnicalWorkerResponseModel? technicalWorkerProfileData;
  final EngineeringOfficeProfileResponseModel? engineeringOfficeProfileData;

  const AboutContactInfoWidget({
    super.key,
    this.engineerProfileResponseModel,
    this.technicalWorkerProfileData,
    this.engineeringOfficeProfileData,
  });

  @override
  State<AboutContactInfoWidget> createState() => _AboutContactInfoWidgetState();
}

class _AboutContactInfoWidgetState extends State<AboutContactInfoWidget> {
  String? selectedGovernorate;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
  }

  @override
  Widget build(BuildContext context) {
    final profileData = widget.engineerProfileResponseModel?.data ??
        widget.technicalWorkerProfileData?.data ??
        widget.engineeringOfficeProfileData?.data;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();
        final isLoading = state is LoadingUpdateProfile;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(32),
            _buildSectionTitle(context),
            verticalSpace(16),
            _buildLocationTile(context, cubit, profileData, isLoading),
            _buildPhoneTile(context, cubit, profileData, isLoading),
            verticalSpace(16),
          ],
        );
      },
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      AppLocale.contactInfo.getString(context),
      style: AppStyles.font16BlackMedium,
    );
  }

  Widget _buildLocationTile(BuildContext context, ProfileCubit cubit,
      dynamic profileData, bool isLoading) {
    final governorateName = (profileData as dynamic)?.user.governorate.name;
    final cityName = (profileData as dynamic)?.user.city.name;

    if (governorateName == null) return SizedBox.shrink();

    return AboutListTileItemWidget(
      imagePath: AppAssets.locationSvg,
      title:
          "${AppLocale.location.getString(context)}$cityName - $governorateName",
      onEdit: () => _showLocationDialog(context, cubit, isLoading),
    );
  }

  Widget _buildPhoneTile(BuildContext context, ProfileCubit cubit,
      dynamic profileData, bool isLoading) {
    final phone = (profileData as dynamic)?.user.phone;

    if (phone == null) {
      return AppCustomAddButton(
        text: AppLocale.addPhone.getString(context),
        onPressed: () => _showEditPhoneDialog(context, cubit, isLoading),
      );
    }

    return AboutListTileItemWidget(
      imagePath: AppAssets.phoneCallIcon,
      title: phone,
      onPressed: () => _launchPhoneDialer(phone),
      onEdit: () => _showEditPhoneDialog(context, cubit, isLoading),
      titleStyle: AppStyles.font16BlackLight.copyWith(
        color: AppColors.blueColor,
        textBaseline: TextBaseline.alphabetic,
        decoration: TextDecoration.underline,
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.semiBold,
      ),
    );
  }

  Future<void> _launchPhoneDialer(String phoneNumber) async {
    final Uri url = Uri.parse('tel:$phoneNumber');
    if (!await launchUrl(url)) {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _showLocationDialog(
      BuildContext context, ProfileCubit cubit, bool isLoading) {
    showDialog(
      context: context,
      builder: (context) => AboutAlertDialog(
        title: AppLocale.editPhone.getString(context),
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
        alertContent: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final cubit = context.read<SignUpCubit>();
            final profileCubit = context.read<ProfileCubit>();
            return Column(
              children: [
                AppCustomDropDownButtonFormField(
                  value: selectedGovernorate,
                  items: cubit.governorates.map((governorate) {
                    return DropdownMenuItem<String>(
                      value: governorate.id.toString(),
                      child: Text(
                        governorate.name,
                        style: AppStyles.font16BlackLight,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGovernorate = value;
                      selectedCity = null;
                      cubit.getCities(int.parse(value!));
                      profileCubit.selectedGovernorate = value;
                    });
                  },
                  labelText: AppLocale.theGovernorate.getString(context),
                ),
                verticalSpace(16),
                AppCustomDropDownButtonFormField(
                  value: selectedCity,
                  items: selectedGovernorate != null
                      ? cubit.cities.map((city) {
                          return DropdownMenuItem<String>(
                            value: city.id.toString(),
                            child: Text(
                              city.name,
                              style: AppStyles.font16BlackLight,
                            ),
                          );
                        }).toList()
                      : [],
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                      profileCubit.selectedCity = value;
                    });
                  },
                  labelText: AppLocale.theCity.getString(context),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showEditPhoneDialog(
      BuildContext context, ProfileCubit cubit, bool isLoading) {
    showDialog(
      context: context,
      builder: (context) => AboutAlertDialog(
        title: AppLocale.editPhone.getString(context),
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
        alertContent: AppTextFormField(
          labelText: AppLocale.phoneNumber.getString(context),
          controller: cubit.phoneController,
          validator: (value) {},
          keyboardType: TextInputType.phone,
        ),
        isLoading: isLoading,
      ),
    );
  }
}
