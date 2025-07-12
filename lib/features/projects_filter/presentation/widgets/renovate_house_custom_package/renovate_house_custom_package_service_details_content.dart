import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_custom_package/renovate_house_custom_package_tab_view_item_title.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/renovate_house_custom_package/renovate_house_custom_package_services_cubit.dart';
import '../../../logic/renovate_house_custom_package/renovate_house_custom_package_services_state.dart';
import '../details/project_details_item_value.dart';
import '../filter_image_and_name_widget.dart';
import 'add_offer_renovate_house_custom_package_button.dart';

class RenovateHouseCustomPackageServiceDetailsContent extends StatelessWidget {
  const RenovateHouseCustomPackageServiceDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateHouseCustomPackageServicesCubit,
        RenovateHouseCustomPackageServicesState>(
      buildWhen: (previous, current) =>
          current.maybeWhen(
            renovateHouseCustomPackageServiceDetailsLoading: () => true,
            renovateHouseCustomPackageServiceDetailsSuccess: (_) => true,
            renovateHouseCustomPackageServiceDetailsFailure: (_) => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return state.maybeWhen(
          renovateHouseCustomPackageServiceDetailsLoading: () =>
              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * 0.5,
                child:
                AppCustomLoadingIndicator(
                  loadingColor: AppColors.primaryColor,
                ),
              ),
          renovateHouseCustomPackageServiceDetailsSuccess: (
              renovateHouseCustomPackage) {
            final renovateHouseData = renovateHouseCustomPackage.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32.h,
              children: [
                Container(
                  width: MediaQuery
                      .sizeOf(context)
                      .width,
                  decoration: BoxDecoration(
                    color: AppColors.containersColor,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16.h,
                      children: [
                        RenovateHouseCustomPackageTabViewItemTitle(
                          packageName: renovateHouseData.customPackage?.name ??
                              'N/A',
                        ),
                        FilterImageAndNameWidget(
                          imageUrl: renovateHouseData.user?.personalPhoto,
                          userName: renovateHouseData.user?.username,
                          timeAgo: formatDate(renovateHouseData.createdDate),
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.unitType.getString(context),
                          value:
                          renovateHouseData.unitType?.name ?? 'N/A',
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.budget.getString(context),
                          value:
                          '${renovateHouseData.customPackage?.price ??
                              0.0} ${AppLocale.egp.getString(context)}',
                        ),
                      ],
                    ),
                  ),
                ),
                AddOfferRenovateHouseCustomPackageButton(
                  requestCount: renovateHouseData.requestCount,
                  askId: renovateHouseData.id ?? 0,
                ),
              ],
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
