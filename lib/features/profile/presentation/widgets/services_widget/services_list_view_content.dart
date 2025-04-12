import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_item.dart';
import 'package:lottie/lottie.dart';

class ServicesListViewContent extends StatelessWidget {
  final int id;
  final int userId;

  const ServicesListViewContent({
    super.key,
    required this.id,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
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