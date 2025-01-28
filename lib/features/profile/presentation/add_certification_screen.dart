import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/widgets/bottom_model.dart';
import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';
import '../logic/certifications/certifications_state.dart';

class AddCertificationScreen extends StatelessWidget {
  const AddCertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => sl<CertificationsCubit>(),
            child: BlocBuilder<CertificationsCubit, CertificationsState>(
              builder: (context, state) {
                final cubit = CertificationsCubit.get(context);
                return Column(
                  children: [
                    AuthWelcomeData(
                      headText: AppLocale.addCertifications.getString(context),
                      subText: '',
                    ),
                    AppTextFormField(
                      labelText: "Name",
                      validator: (value) {},
                      controller: cubit.nameController,
                    ),
                    AppTextFormField(
                      labelText: "description",
                      validator: (value) {},
                      controller: cubit.descriptionController,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 150,
                                child: BottomModel(cubit: cubit),
                              );
                            });
                      },
                      child: Container(
                          height: 100.h,
                          width: 100.h,
                          margin: const EdgeInsets.only(top: 30),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purpleAccent.withOpacity(0.5),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (cubit.image != null)
                                Image.file(
                                  cubit.image!,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: cubit.image != null
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ],
                          )),
                    ),
                    AppCustomButton(
                        textButton: "Add",
                        btnWidth: MediaQuery.sizeOf(context).width,
                        btnHeight: 60.h,
                        onPressed: (){
                          cubit.addCertification();
                        })
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
