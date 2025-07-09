import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_tab_view_item_title.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../locale/app_locale.dart';
import '../details/project_details_governorate_city_row.dart';
import '../details/project_details_item_value.dart';
import '../filter_image_and_name_widget.dart';
import '../project_skills_needed_widget.dart';
import 'add_offer_renovate_house_button.dart';

class RenovateHouseServiceDetailsContent extends StatelessWidget {
  const RenovateHouseServiceDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RenovateHouseServicesCubit, RenovateHouseServicesState>(
      buildWhen: (previous, current) => current.maybeWhen(
        renovateHouseServiceDetailsLoading: () => true,
        renovateHouseServiceDetailsSuccess: (_) => true,
        renovateHouseServiceDetailsFailure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          renovateHouseServiceDetailsLoading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          renovateHouseServiceDetailsSuccess: (service) {
            final renovateHouseData = service.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32.h,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
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
                        RenovateHouseTabViewItemTitle(
                          unitArea: renovateHouseData.unitArea ?? 0.0,
                          unitType: renovateHouseData.unitType?.name ?? 'N/A',
                        ),
                        FilterImageAndNameWidget(
                          imageUrl: renovateHouseData.user?.personalPhoto,
                          userName: renovateHouseData.user?.username,
                          timeAgo: formatDate(renovateHouseData.createdDate),
                        ),
                        ProjectDetailsGovernorateCityRow(
                          governorate:
                              renovateHouseData.governorate?.name ?? 'N/A',
                          city: renovateHouseData.city?.name ?? 'N/A',
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                    AppLocale.numberOfRooms.getString(context),
                                value: '${renovateHouseData.numberOfRooms}',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle: AppLocale.region.getString(context),
                                value: '${renovateHouseData.region}',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle: AppLocale.numberOfBathrooms
                                    .getString(context),
                                value: '${renovateHouseData.numberOfBathrooms}',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                    AppLocale.durationInDays.getString(context),
                                value: '${renovateHouseData.requiredDuration}',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                    AppLocale.unitStatus.getString(context),
                                value: renovateHouseData.unitStatuses?.name ??
                                    'N/A',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                    AppLocale.unitWorkType.getString(context),
                                value: renovateHouseData.unitWorkTypes?.name ??
                                    'N/A',
                              ),
                            ),
                          ],
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.budget.getString(context),
                          value:
                              '${renovateHouseData.budget} ${AppLocale.egp.getString(context)}',
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.notes.getString(context),
                          value: renovateHouseData.notes ?? 'N/A',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProjectSkillsNeededWidget(
                              skillNeeded:
                                  renovateHouseData.workSkills?.name ?? 'N/A',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AddOfferRenovateHouseButton(
                  askId: renovateHouseData.id ?? 0,
                  requestCount: renovateHouseData.requestCount,
                ),
              ],
            );
          },
          renovateHouseServiceDetailsFailure: (error) => Center(
            child: Text('Error: $error'),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
