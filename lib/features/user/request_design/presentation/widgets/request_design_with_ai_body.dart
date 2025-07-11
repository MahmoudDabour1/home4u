import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/core/widgets/select_single_image.dart';

import '../../logic/request_design_cubit.dart';

class RequestDesignWithAiBody extends StatelessWidget {
  const RequestDesignWithAiBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestDesignCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(16),
          SelectSingleImageWidget(
            cubit: cubit,
            image: cubit.image,
            updateImageCallback: cubit.updateSelectedImages,
          ),
          verticalSpace(16),
          AppTextFormField(
            labelText: "Promote",
            validator: (value) {},
            maxLines: 7,
          ),
          verticalSpace(16),
          AppCustomButton(
            textButton: "Generate",
            btnWidth: MediaQuery.sizeOf(context).width,
            btnHeight: 50.h,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
