import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_state.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/select_image_widget.dart';

class AddCertificationsInfo extends StatelessWidget {

  const AddCertificationsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<CertificationsCubit, CertificationsState>(
        builder: (context, state) {
          final cubit = CertificationsCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                SelectImageWidget(
                  cubit: cubit,
                  image: cubit.image,
                ),
                verticalSpace(16),
                AppTextFormField(
                  labelText: AppLocale.name.getString(context),
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppLocale.nameCantBeEmpty.getString(context);
                    }
                  },
                  controller: cubit.nameController,
                ),
                verticalSpace(16),
                AppTextFormField(
                  labelText: AppLocale.description.getString(context),
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppLocale.descriptionCantBeEmpty
                          .getString(context);
                    }
                  },
                  controller: cubit.descriptionController,
                ),
                verticalSpace(30),
                AppCustomButton(
                  textButton: AppLocale.add.getString(context),
                  btnWidth: MediaQuery.sizeOf(context).width,
                  isLoading: state is AddCertificationLoading,
                  btnHeight: 60.h,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                        cubit.addCertification(context);
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
