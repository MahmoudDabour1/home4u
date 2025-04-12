import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/sign_up_cubit.dart';

class EngineeringOfficeInputs extends StatefulWidget {
  const EngineeringOfficeInputs({super.key});

  @override
  State<EngineeringOfficeInputs> createState() =>
      _EngineeringOfficeInputsState();
}

class _EngineeringOfficeInputsState extends State<EngineeringOfficeInputs> {
  late FocusNode _tradeNameFocusNode;
  late FocusNode _descriptionFocusNode;

  @override
  void initState() {
    super.initState();
    _tradeNameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _tradeNameFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Column(
      spacing: 16.h,
      children: [
        verticalSpace(16),
        AppTextFormField(
          controller: signUpCubit.tradNameController,
          labelText: AppLocale.tradeName.getString(context),
          focusNode: _tradeNameFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your trade name";
            }
            return null;
          },
        ),
        AppTextFormField(
          controller: signUpCubit.descriptionController,
          labelText: AppLocale.description.getString(context),
          focusNode: _descriptionFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your description";
            }
            return null;
          },
        ),
      ],
    );
  }
}
