import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_back_button.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';

import '../../../../locale/app_locale.dart';

class GenericAddOfferScreen<TCubit extends Cubit<TState>, TState>
    extends StatelessWidget {
  final String screenTitle;
  final GlobalKey<FormState> formKey;
  final TextEditingController commentController;
  final void Function() onSubmit;
  final bool Function(TState state) isLoading;
  final bool Function(TState state) isSuccess;
  final bool Function(TState state) isFailure;
  final String Function(TState state)? errorExtractor;

  const GenericAddOfferScreen({
    super.key,
    required this.screenTitle,
    required this.formKey,
    required this.commentController,
    required this.onSubmit,
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
    this.errorExtractor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: AppBackButton(),
        ),
        title: Text(
          screenTitle,
          style: AppStyles.font18BlackMedium,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<TCubit, TState>(
        listener: (context, state) {
          if (isSuccess(state)) {
            context.pop();
            showToast(
              message: 'Your offer has been added successfully',
              isError: false,
            );
          } else if (isFailure(state)) {
            showToast(
              message: errorExtractor?.call(state) ?? 'Something went wrong',
              isError: true,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '✅ Write your offer with a meaningful description and price for the service you provide to the user who asked for it .....',
                        style: AppStyles.font16BlackMedium,
                      ),
                      SizedBox(height: 32.h),
                      AppTextFormField(
                        labelText: AppLocale.description.getString(context),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        controller: commentController,
                        decoration: getCommonInputDecoration(
                          labelText: AppLocale.description.getString(context),
                        ).copyWith(
                          constraints: BoxConstraints(maxHeight: 250.h),
                          isDense: true,
                        ),
                        maxLines: 15,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter your offer details";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32.h),
                      AppCustomButton(
                        textButton: screenTitle,
                        btnWidth: MediaQuery.sizeOf(context).width,
                        btnHeight: 50.h,
                        isLoading: isLoading(state),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            onSubmit();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
