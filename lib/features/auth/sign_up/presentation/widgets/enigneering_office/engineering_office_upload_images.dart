import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/select_image_widget.dart';

class EngineeringOfficeUploadImages extends StatelessWidget {
  const EngineeringOfficeUploadImages({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
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
        SelectImageWidget(
          cubit: cubit,
          images: [],
        ),
        Text(
          "Tax Card",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectImageWidget(
          cubit: cubit,
          images: [],
        ),
        Text(
          "Personal Card",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectImageWidget(
          cubit: cubit,
          images: [],
        ),
      ],
    );
  }
}
