import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';

import 'fixed_package_card_item.dart';

class FixedPackageListView extends StatefulWidget {
  const FixedPackageListView({super.key});

  @override
  State<FixedPackageListView> createState() => _FixedPackageListViewState();
}

class _FixedPackageListViewState extends State<FixedPackageListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        return state.maybeWhen(
          renovateYourHouseFixedPackagesLoaded: (fixedPackages) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FixedPackageCard(
                  package: fixedPackages.data[index],
                  onBooking: () {
                    final cubit = context.read<RenovateYourHouseCubit>();
                    cubit.selectedFixedPackageId = fixedPackages.data[index].id;

                    cubit.chooseFixedPackageRenovateYourHouse(
                      cubit.prepareFixedPackageBody(),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 24.h);
              },
              itemCount: fixedPackages.data.length,
            );
          },
          orElse: () {
            return const SizedBox();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final cubit = context.read<RenovateYourHouseCubit>();
    cubit.getRenovateYourHouseFixedPackages();
  }
}
