import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/ask_technical_worker/logic/ask_technical_cubit.dart';
import 'package:home4u/features/ask_technical_worker/logic/ask_technical_state.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/theming/app_styles.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/app_custom_button.dart';
import '../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../core/widgets/select_image_widget.dart';

class AskTechnicalFinishAndImage extends StatefulWidget {
  const AskTechnicalFinishAndImage({super.key});

  @override
  State<AskTechnicalFinishAndImage> createState() => _AskTechnicalFinishAndImageState();
}

class _AskTechnicalFinishAndImageState extends State<AskTechnicalFinishAndImage> {
  final formKey = GlobalKey<FormState>();
  String? selectMaterial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AskTechnicalCubit, AskTechnicalState>(
  builder: (context, state) {
    final askTechnicalCubit = context.read<AskTechnicalCubit>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
              children: [
                AuthWelcomeData(
                    headText: AppLocale.askTechnical.getString(context), subText: ""),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      verticalSpace(32),
                      AppCustomDropDownButtonFormField(
                        value: selectMaterial,
                        items: askTechnicalCubit.selectMaterialList
                            .map((unitType) {
                          return DropdownMenuItem<String>(
                            value: unitType.id.toString(),
                            child: Text(
                              unitType.name ?? '',
                              style: AppStyles.font16BlackLight,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectMaterial = value;
                            askTechnicalCubit.selectMaterial = value;
                          });
                        },
                        labelText:
                        AppLocale.materialNeeded.getString(context),
                        validator: (value) {
                          if (value == null) {
                            return AppLocale.pleaseSelectMaterialNeeded
                                .getString(context);
                          }
                          return null;
                        },
                      ),
                      verticalSpace(16),
                      SelectImageWidget(
                        cubit: askTechnicalCubit,
                        images: askTechnicalCubit.images,
                        updateImageCallback:
                        askTechnicalCubit.updateSelectedImages,
                      ),
                      verticalSpace(16),
                      AppCustomButton(
                        textButton: AppLocale.confirm,
                        btnWidth: MediaQuery.sizeOf(context).width,
                        btnHeight: 56.h,
                        isLoading: state is AskTechnicalLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            askTechnicalCubit.askTechnical(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  },
),
    );
  }
}
