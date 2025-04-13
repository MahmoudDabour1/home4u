import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_content.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../../logic/services/services_cubit.dart';

class ServicesListView extends StatefulWidget {
  const ServicesListView({super.key});

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView> {
  late int id;
  late int userId;
  late int typeId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // _loadUserType();
    _initializeProfileData();
  }

  //
  // void _loadUserType() async {
  //   setState(() {
  //     isEngineer = userType == "ENGINEER";
  //   });
  // }
  //
  Future<void> _initializeProfileData() async {
    final userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);

    var engineerBox =
    await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var engineerProfileData = engineerBox.get(kEngineerProfileData);
    var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
        kTechnicalWorkerProfileBox);
    var technicalWorkerProfileData =
    technicalWorkerBox.get(kTechnicalWorkerProfileData);
    var engineeringOfficeBox =
    await Hive.openBox<EngineeringOfficeProfileResponseModel>(
        kEngineeringOfficeProfileBox);
    var engineeringOfficeProfileData =
    engineeringOfficeBox.get(kEngineeringOfficeProfileData);

    switch (userType) {
      case "ENGINEER":
        id = engineerProfileData?.data?.id ?? 0;
        userId = engineerProfileData?.data?.user?.id ?? 0;
        typeId = engineerProfileData?.data?.type?.id ?? 0;
        break;
      case "ENGINEERING_OFFICE":
        id = engineeringOfficeProfileData?.data?.id ?? 0;
        userId = engineeringOfficeProfileData?.data?.user?.id ?? 0;
        typeId =
            engineeringOfficeProfileData?.data?.engineeringOfficeField?.id ?? 0;
        break;
      default:
        id = technicalWorkerProfileData?.data?.id ?? 0;
        userId = technicalWorkerProfileData?.data?.user?.id ?? 0;
        typeId = technicalWorkerProfileData?.data?.type?.id ?? 0;
    }

    ///Todo : refactor again
    context.read<ServicesCubit>().getServices(id: id);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ServicesListViewContent(id: id, userId: userId);
  }
}
