import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_item.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/profile/engineer_profile_response_model.dart';

class ServicesListView extends StatefulWidget {
  const ServicesListView({super.key});

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView> {
  late Future<void> _profileDataFuture;
  late int engineerId;
  late int userId;
  late int engineerTypeId;

  @override
  void initState() {
    super.initState();
    _profileDataFuture = _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var profileBox = await Hive.openBox<EngineerProfileResponseModel>(kProfileBox);
    var profileData = profileBox.get(kProfileData);
    engineerId = profileData?.data?.id ?? 0;
    userId = profileData?.data?.user?.id ?? 0;
    engineerTypeId = profileData?.data?.type?.id ?? 0;
    context.read<ServicesCubit>().getServices(engineerId: engineerId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
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
          return BlocBuilder<ServicesCubit, ServicesState>(
            buildWhen: (previous, current) {
              return current is DeleteServiceSuccess ||
                  current is UpdateServicesSuccess ||
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
                          engineerId: engineerId,
                          serviceId: servicesData.data[index].id,
                          selectedService: servicesData.data[index],
                          userId: userId,
                          engineerTypeId: engineerTypeId,
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
      },
    );
  }
}
