import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_state.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/bottom_model.dart';
import '../../../../../core/widgets/select_image_widget.dart';

class AddCertificationsInfo extends StatelessWidget {
  final bool isEditing;
  const AddCertificationsInfo({super.key, required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<CertificationsCubit, CertificationsState>(
        builder: (context, state) {
          final cubit = CertificationsCubit.get(context);
          return Column(
            children: [
              SelectImageWidget(
                cubit: cubit,
                image: cubit?.image,
              ),
              verticalSpace(16),
              AppTextFormField(
                labelText: AppLocale.name.getString(context),
                validator: (value) {},
                controller: cubit.nameController,
              ),
              verticalSpace(16),
              AppTextFormField(
                labelText: AppLocale.description.getString(context),
                validator: (value) {},
                controller: cubit.descriptionController,
              ),
              verticalSpace(30),
              AppCustomButton(
                textButton: isEditing?AppLocale.update:AppLocale.add.getString(context),
                btnWidth: MediaQuery.sizeOf(context).width,
                isLoading: state is AddCertificationLoading,
                btnHeight: 60.h,
                onPressed: () {
                  if (isEditing) {
                    cubit.updateCertification(context);  // Add method to handle updating
                  } else {
                    cubit.addCertification();
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}
