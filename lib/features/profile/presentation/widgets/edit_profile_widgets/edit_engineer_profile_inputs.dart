import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../logic/profile/profile_state.dart';
import 'edit_profile_drop_down_buttons.dart';

class EditEngineerProfileInputs extends StatefulWidget {
  const EditEngineerProfileInputs({super.key});

  @override
  State<EditEngineerProfileInputs> createState() =>
      _EditEngineerProfileInputsState();
}

class _EditEngineerProfileInputsState extends State<EditEngineerProfileInputs> {
  EngineerProfileResponseModel? profileCachedData;
  String? selectedGovernorate;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
    _loadProfileData();
  }

  void _loadProfileData() async {
    var engineerBoxData =
        await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var profileData = engineerBoxData.get(kEngineerProfileData);
    setState(() {
      profileCachedData = profileData;
      selectedGovernorate =
          profileData?.data?.user?.governorate?.id?.toString();
      selectedCity = profileData?.data?.user?.city?.id?.toString();
      final cubit = context.read<ProfileCubit>();
      cubit.selectedGovernorate = selectedGovernorate;
      cubit.selectedCity = selectedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          cubit.firstNameController.text =
              profileCachedData?.data?.user?.firstName ?? '';
          cubit.lastNameController.text =
              profileCachedData?.data?.user?.lastName ?? '';
          cubit.yearsOfExperience.text =
              profileCachedData?.data?.yearsOfExperience.toString() ?? '';
          cubit.bioController.text = profileCachedData?.data?.bio ?? '';
          cubit.linkedinController.text =
              profileCachedData?.data?.linkedin ?? '';
          cubit.behanceController.text = profileCachedData?.data?.behance ?? '';
          cubit.selectedCity =
              profileCachedData?.data?.user?.city?.id.toString() ?? '';
          cubit.selectedGovernorate =
              profileCachedData?.data?.user?.governorate?.id.toString() ?? '';
          return Column(
            children: [
              verticalSpace(32),
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      controller: cubit.firstNameController,
                      labelText: AppLocale.firstName.getString(context),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocale.enterValidName.getString(context);
                        }
                      },
                    ),
                  ),
                  horizontalSpace(8),
                  Expanded(
                    child: AppTextFormField(
                      controller: cubit.lastNameController,
                      labelText: AppLocale.lastName.getString(context),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppLocale.enterValidName.getString(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              EditProfileDropDownButtons(),
              verticalSpace(16),
              AppTextFormField(
                  controller: cubit.yearsOfExperience,
                  labelText: AppLocale.yearsOfExperience.getString(context),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {}),
              verticalSpace(16),
              AppTextFormField(
                  controller: cubit.bioController,
                  labelText: AppLocale.bio.getString(context),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {}),
              verticalSpace(16),
              AppTextFormField(
                  controller: cubit.linkedinController,
                  labelText: AppLocale.linkedin.getString(context),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {}),
              verticalSpace(16),
              AppTextFormField(
                  controller: cubit.behanceController,
                  labelText: AppLocale.behance.getString(context),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {}),
              verticalSpace(32),
              AppCustomButton(
                isLoading: state is LoadingUpdateProfile,
                textButton: AppLocale.update.getString(context),
                btnHeight: 65.h,
                btnWidth: MediaQuery.sizeOf(context).width,
                onPressed: () {
                  cubit.updateEngineerProfileData(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
