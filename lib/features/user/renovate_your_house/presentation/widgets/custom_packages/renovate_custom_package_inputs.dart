import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/renovate_your_house_cubit.dart';

class RenovateCustomPackageInputs extends StatefulWidget {
  const RenovateCustomPackageInputs({super.key});

  @override
  State<RenovateCustomPackageInputs> createState() =>
      _RenovateCustomPackageInputsState();
}

class _RenovateCustomPackageInputsState
    extends State<RenovateCustomPackageInputs> {
  late final FocusNode unitAreaFocusNode;
  late final FocusNode budgetFocusNode;
  late final FocusNode regionFocusNode;
  late final FocusNode numberOfRoomsFocusNode;
  late final FocusNode numberOfBathRoomsFocusNode;
  late final FocusNode requiredDurationFocusNode;

  @override
  void initState() {
    super.initState();
    unitAreaFocusNode = FocusNode();
    budgetFocusNode = FocusNode();
    regionFocusNode = FocusNode();
    numberOfRoomsFocusNode = FocusNode();
    numberOfBathRoomsFocusNode = FocusNode();
    requiredDurationFocusNode = FocusNode();
  }

  @override
  void dispose() {
    unitAreaFocusNode.dispose();
    budgetFocusNode.dispose();
    regionFocusNode.dispose();
    numberOfRoomsFocusNode.dispose();
    numberOfBathRoomsFocusNode.dispose();
    requiredDurationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RenovateYourHouseCubit>();
    return Column(
      spacing: 16.h,
      children: [
        AppTextFormField(
          controller: cubit.unitAreaController,
          labelText: AppLocale.unitArea.getString(context),
          focusNode: unitAreaFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your unit area";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.budgetController,
          labelText: AppLocale.budget.getString(context),
          focusNode: budgetFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your budget";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.regionController,
          labelText: AppLocale.region.getString(context),
          focusNode: regionFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your region";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.numberOfRoomsController,
          labelText: AppLocale.numberOfRooms.getString(context),
          focusNode: numberOfRoomsFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your number of rooms";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.numberOfBathRoomsController,
          labelText: AppLocale.numberOfBathrooms.getString(context),
          focusNode: numberOfBathRoomsFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your number of bath rooms";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.requiredDurationInDaysController,
          labelText: AppLocale.durationInDays.getString(context),
          focusNode: requiredDurationFocusNode,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your required duration in days";
            }
          },
        ),
        AppTextFormField(
          controller: cubit.notesController,
          labelText: AppLocale.notes.getString(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          decoration: getCommonInputDecoration(
            labelText: AppLocale.notes.getString(context),
          ).copyWith(
            constraints: BoxConstraints(
              maxHeight: 120.h,
            ),
            alignLabelWithHint: true,
            isDense: true,
          ),
          maxLines: 10,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your notes";
            }
            return null;
          },
        ),
      ],
    );
  }
}
