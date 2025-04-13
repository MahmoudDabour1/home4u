import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_content.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';

class ServicesListView extends StatefulWidget {
  const ServicesListView({super.key});

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView> {
  late Future<void> _profileDataFuture;
  late int id;
  late int userId;
  late int engineerTypeId;
  late bool isEngineer;

  @override
  void initState() {
    super.initState();
    _loadUserType();
    _profileDataFuture = _initializeProfileData();
  }

  void _loadUserType() async {
    final userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);
    setState(() {
      isEngineer = userType == "ENGINEER";
    });
  }

  Future<void> _initializeProfileData() async {
    var engineerBox =
    await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var engineerProfileData = engineerBox.get(kEngineerProfileData);
    var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
        kTechnicalWorkerProfileBox);
    var technicalWorkerProfileData =
    technicalWorkerBox.get(kTechnicalWorkerProfileData);

    id = (isEngineer
        ? engineerProfileData?.data?.id
        : technicalWorkerProfileData?.data?.id ?? 0)!;
    userId = engineerProfileData?.data?.user?.id ?? 0;
    engineerTypeId = engineerProfileData?.data?.type?.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      initialData: _profileDataFuture,
      future: _profileDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          context.read<ServicesCubit>().getServices(id: id);
          return ServicesListViewContent(id: id, userId: userId);
        }
      },
    );
  }
}
