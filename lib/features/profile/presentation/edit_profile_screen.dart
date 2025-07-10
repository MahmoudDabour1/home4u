import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/profile/presentation/widgets/edit_profile_widgets/edit_engineer_profile_inputs.dart';
import 'package:home4u/features/profile/presentation/widgets/edit_profile_widgets/edit_engineering_office_inputs.dart';
import 'package:home4u/features/profile/presentation/widgets/edit_profile_widgets/edit_technical_worker_profile_inputs.dart';

import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool? isEngineer;

  bool? isTechnicalWorker;
  String? setUserType;

  @override
  void initState() {
    super.initState();
    _loadUserType();
  }

  void _loadUserType() async {
    final userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);
    setState(() {
      isEngineer = userType == 'ENGINEER';
      isTechnicalWorker = userType == 'TECHNICAL_WORKER';
      setUserType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppLocale.updateYourProfile.getString(context),
                subText: '',
              ),
          setUserType == 'ENGINEER'
            ? EditEngineerProfileInputs()
            : setUserType == 'TECHNICAL_WORKER'
                ? EditTechnicalWorkerProfileInputs()
                : EditEngineeringOfficeInputs(),
            ],
          ),
        ),
      ),
    );
  }
}
