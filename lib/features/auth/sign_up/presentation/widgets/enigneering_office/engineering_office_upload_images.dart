import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/select_single_image.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../../core/utils/spacing.dart';

class EngineeringOfficeUploadImages extends StatelessWidget {
  const EngineeringOfficeUploadImages({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final images = context.watch<SignUpCubit>().images;
    final commercialImage =
        context.watch<SignUpCubit>().commercialRegisterImage;
    final taxCardImage = context.watch<SignUpCubit>().taxCardImage;
    final personalCardImage = context.watch<SignUpCubit>().personalCardImage;

    return Column(
      spacing: 16.h,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(8),
        Text(
          "Commercial Registration",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectSingleImageWidget(
          cubit: cubit,
          image: commercialImage,
          updateImageCallback: cubit.updateCommercialRegisterImage,
        ),
        Text(
          "Tax Card",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectSingleImageWidget(
          cubit: cubit,
          image: taxCardImage,
          updateImageCallback: cubit.updateTaxCardImage,
        ),
        Text(
          "Personal Card",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectSingleImageWidget(
          cubit: cubit,
          image: personalCardImage,
          updateImageCallback: cubit.updatePersonalCardImage,
        ),
      ],
    );
  }
}
