import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_item.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/helpers/shared_pref_keys.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';

class ServicesListView extends StatefulWidget {
  const ServicesListView({
    super.key,
  });

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView>
    with AutomaticKeepAliveClientMixin {
  late int id;
  late int userId;
  late int typeId;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  @override
  bool get wantKeepAlive => true;

  ///ToDo : Loading behaviour try to change them , to appear there is nothing happen while delete and update
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
      case "TECHNICAL_WORKER":
        id = technicalWorkerProfileData?.data?.id ?? 0;
        userId = technicalWorkerProfileData?.data?.user?.id ?? 0;
        typeId = technicalWorkerProfileData?.data?.type?.id ?? 0;
        break;
      default:
        throw Exception("Invalid user type");
    }

    context.read<ServicesCubit>().getServices(id: id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ServicesCubit, ServicesState>(
      buildWhen: (previous, current) {
        return current is DeleteServiceSuccess ||
            current is UpdateServicesSuccess ||
            (previous != current && current is UpdateServicesSuccess) ||
            current is GetServicesSuccess ||
            current is GetServicesError ||
            current is GetServicesLoading;
      },
      builder: (context, state) {
        return state.maybeWhen(
          getServicesSuccess: (servicesData) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: servicesData.data.length,
                itemBuilder: (context, index) {
                  return ServicesListViewItem(
                    serviceName: servicesData.data[index].name ?? '',
                    id: id,
                    serviceId: servicesData.data[index].id,
                    userId: userId,
                  );
                },
              ),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
