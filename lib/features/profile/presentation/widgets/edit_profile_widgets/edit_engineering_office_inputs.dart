import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/utils/app_constants.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';

import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../../auth/sign_up/presentation/widgets/enigneering_office/engineering_office_drop_down_buttons.dart';
import 'edit_profile_drop_down_buttons.dart';

class EditEngineeringOfficeInputs extends StatefulWidget {
  const EditEngineeringOfficeInputs({super.key});

  @override
  State<EditEngineeringOfficeInputs> createState() =>
      _EditEngineeringOfficeInputsState();
}

class _EditEngineeringOfficeInputsState
    extends State<EditEngineeringOfficeInputs> {
  EngineeringOfficeProfileResponseModel? profileCachedData;
  String? selectedGovernorate;
  String? selectedCity;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getGovernorates();
    _loadProfileData();
  }

  void _loadProfileData() async {
    var engineeringOfficeBox =
        await Hive.openBox<EngineeringOfficeProfileResponseModel>(
            kEngineeringOfficeProfileBox);
    var profileData = engineeringOfficeBox.get(kEngineeringOfficeProfileData);
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
          cubit.selectedCity =
              profileCachedData?.data?.user?.city?.id.toString() ?? '';
          cubit.selectedGovernorate =
              profileCachedData?.data?.user?.governorate?.id.toString() ?? '';
          cubit.selectEngineeringOfficeField =
              profileCachedData?.data?.engineeringOfficeField?.id.toString() ??
                  "";
          cubit.tradeNameController.text = profileCachedData?.data?.name ?? '';
          cubit.descriptionController.text =
              profileCachedData?.data?.description ?? '';
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
                        if (value.isEmpty ?? true) {
                          return AppLocale.enterValidName.getString(context);
                        }
                        return null;
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
                        if (value.isEmpty ?? true) {
                          return AppLocale.enterValidName.getString(context);
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              EditProfileDropDownButtons(),
              EngineeringOfficeDropDownButtons(),
              verticalSpace(16),
              AppTextFormField(
                controller: cubit.tradeNameController,
                labelText: AppLocale.tradeName.getString(context),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty ?? true) {
                    return "Please enter your trade name";
                  }
                  return null;
                },
              ),
              verticalSpace(16),
              AppTextFormField(
                controller: cubit.descriptionController,
                labelText: AppLocale.description.getString(context),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty ?? true) {
                    return "Please enter your description";
                  }
                  return null;
                },
              ),
              verticalSpace(32),
              AppCustomButton(
                isLoading: state is LoadingUpdateProfile,
                textButton: AppLocale.update.getString(context),
                btnHeight: 65.h,
                btnWidth: MediaQuery.sizeOf(context).width,
                onPressed: () {
                  cubit.updateEngineeringOfficeProfileData(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
