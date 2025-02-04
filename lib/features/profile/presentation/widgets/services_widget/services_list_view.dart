import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_item.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/profile/profile_response_model.dart';

class ServicesListView extends StatefulWidget {
  const ServicesListView({super.key});

  @override
  State<ServicesListView> createState() => _ServicesListViewState();
}

class _ServicesListViewState extends State<ServicesListView> {
  late int engineerId;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var profileBox = await Hive.openBox<ProfileResponseModel>(kProfileBox);
    var profileData = profileBox.get(kProfileData);
    engineerId = profileData?.data?.id ?? 0;
    context.read<ServicesCubit>().getServices(engineerId: engineerId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
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
