import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/core/widgets/select_single_image.dart';

import '../../logic/request_design_cubit.dart';
import '../../logic/request_design_state.dart';

class RequestDesignWithAiBody extends StatefulWidget {
  const RequestDesignWithAiBody({super.key});

  @override
  State<RequestDesignWithAiBody> createState() =>
      _RequestDesignWithAiBodyState();
}

class _RequestDesignWithAiBodyState extends State<RequestDesignWithAiBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RequestDesignCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(16),
          BlocBuilder<RequestDesignCubit, RequestDesignState>(
            builder: (context, state) {
              if (state is RequestDesignAiSuccess) {
                debugPrint("success");
                debugPrint("AI Design Data: ${state.data.length} bytes");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Generated Design:",
                        style: Theme.of(context).textTheme.titleMedium),
                    verticalSpace(12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.memory(state.data),
                    ),
                  ],
                );
              } else if (state is RequestDesignAiFailure) {
                debugPrint("error");
                return Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text('Error: ${state.error}',
                      style: const TextStyle(color: Colors.red)),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          verticalSpace(16),
          BlocBuilder<RequestDesignCubit, RequestDesignState>(
            builder: (context, state) {
              return SelectSingleImageWidget(
                cubit: cubit,
                image: cubit.image,
                updateImageCallback: cubit.updateSelectedImages,
              );
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            labelText: "Prompt",
            controller: cubit.promptController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a prompt";
              }
              return null;
            },
            maxLines: 5,
          ),
          verticalSpace(16),
          BlocBuilder<RequestDesignCubit, RequestDesignState>(
            builder: (context, state) {
              return AppCustomButton(
                textButton: "Generate",
                btnWidth: MediaQuery.sizeOf(context).width,
                btnHeight: 50.h,
                isLoading: state is RequestDesignAiLoading,
                onPressed: cubit.requestDesignAi,
              );
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
