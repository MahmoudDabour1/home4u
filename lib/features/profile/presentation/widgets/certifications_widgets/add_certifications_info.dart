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
          return Column(
            children: [
              // GestureDetector(
              //   onTap: () {
              //     showModalBottomSheet(
              //       isScrollControlled: true,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(20.r),
              //           topRight: Radius.circular(20.r),
              //         ),
              //       ),
              //       context: context,
              //       builder: (context) {
              //         return SizedBox(
              //           height: 150.h,
              //           child: BottomModel(cubit: cubit),
              //         );
              //       },
              //     );
              //   },
              //   child: SizedBox(
              //     height: 120.h,
              //     width: MediaQuery.sizeOf(context).width - 48.w,
              //     child: DottedBorder(
              //       padding: EdgeInsets.all(20.r),
              //       strokeCap: StrokeCap.round,
              //       borderType: BorderType.RRect,
              //       radius: Radius.circular(20.r),
              //       dashPattern: [10, 10],
              //       color: AppColors.primaryColor,
              //       strokeWidth: 2,
              //       child: Stack(
              //         alignment: Alignment.center,
              //         children: [
              //           cubit.image != null
              //               ? Center(
              //                   child: Image.file(
              //                     cubit.image!,
              //                     width:
              //                         MediaQuery.sizeOf(context).width - 48.w,
              //                     fit: BoxFit.fitWidth,
              //                   ),
              //                 )
              //               : Center(
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Icon(
              //                         Icons.camera_alt,
              //                         color: AppColors.primaryColor,
              //                       ),
              //                       verticalSpace(10),
              //                       Text(
              //                         AppLocale.tapToAddImage
              //                             .getString(context),
              //                         style: AppStyles.font14DarkBlueBold,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SelectImageWidget(
                cubit: cubit,
                image: cubit.image,
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
                textButton: AppLocale.add.getString(context),
                btnWidth: MediaQuery.sizeOf(context).width,
                isLoading: state is AddCertificationLoading,
                btnHeight: 60.h,
                onPressed: () {
                  cubit.addCertification();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
