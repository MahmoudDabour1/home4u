// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:home4u/core/extensions/navigation_extension.dart';
// import 'package:home4u/core/helpers/helper_methods.dart';
// import 'package:home4u/core/widgets/app_back_button.dart';
// import 'package:home4u/core/widgets/app_custom_button.dart';
// import 'package:home4u/features/projects_filter/logic/ask_engineer/ask_engineer_services_cubit.dart';
// import 'package:home4u/features/projects_filter/logic/ask_engineer/ask_engineer_services_state.dart';
//
// import '../../../core/theming/app_styles.dart';
// import '../../../core/widgets/app_text_form_field.dart';
// import '../../../core/widgets/get_common_input_decoration.dart';
// import '../../../locale/app_locale.dart';
// import '../data/models/add_request/ask_engineer/add_ask_engineer_request_body.dart';
//
// class AddOfferScreen extends StatelessWidget {
//   final int askId;
//
//   const AddOfferScreen({super.key, required this.askId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: AppBackButton(),
//         ),
//         title: Text(
//           AppLocale.addOffer.getString(context),
//           style: AppStyles.font18BlackMedium,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
//             child: BlocConsumer<AskEngineerServicesCubit,
//                 AskEngineerServicesState>(
//               listener: (context, state) {
//                 if (state is RequestAskEngineerSuccess) {
//                   context.pop();
//                   showToast(
//                     message: 'Your offer has been added successfully',
//                     isError: false,
//                   );
//                 } else if (state is RequestAskEngineerFailure) {
//                   showToast(
//                     message: state.error,
//                     isError: true,
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 final cubit = context.read<AskEngineerServicesCubit>();
//                 return Form(
//                   key: cubit.askEngineerFormKey,
//                   child: Center(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       spacing: 32.h,
//                       children: [
//                         Text(
//                           '✅ Write your offer with a meaningful description and price for the service you provide to the user who asked for it .....',
//                           style: AppStyles.font16BlackMedium,
//                         ),
//                         AppTextFormField(
//                           labelText: AppLocale.projectDescription.getString(context),
//                           keyboardType: TextInputType.multiline,
//                           textInputAction: TextInputAction.newline,
//                           controller: cubit.commentController,
//                           decoration: getCommonInputDecoration(
//                             labelText: AppLocale.description.getString(context),
//                           ).copyWith(
//                             constraints: BoxConstraints(
//                               maxHeight: 250.h,
//                             ),
//                             isDense: true,
//                           ),
//                           maxLines: 15,
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return "Please enter your offer details";
//                             }
//                             return null;
//                           },
//                         ),
//                         AppCustomButton(
//                           textButton: AppLocale.addOffer.getString(context),
//                           btnWidth: MediaQuery.sizeOf(context).width,
//                           btnHeight: 50.h,
//                           isLoading: state is RequestAskEngineerLoading,
//                           onPressed: () {
//                             if (cubit.askEngineerFormKey.currentState!
//                                 .validate()) {
//                               cubit.requestAskEngineer(
//                                 askEngineerRequestBody:
//                                     AddAskEngineerRequestBody(
//                                   askEngineer: AskEngineer(id: askId),
//                                   comment: cubit.commentController.text,
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
