import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/ask_engineer/ask_engineer_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/ask_engineer/ask_engineer_services_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_engineer_widgets/ask_engineer_tab_view_item_title.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../../../locale/app_locale.dart';
import '../details/project_details_governorate_city_row.dart';
import '../details/project_details_item_value.dart';
import '../details/project_details_photos_list_view.dart';
import '../filter_image_and_name_widget.dart';
import 'add_offer_ask_engineer_button.dart';

class AskEngineerServiceContentDetails extends StatelessWidget {
  const AskEngineerServiceContentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskEngineerServicesCubit, AskEngineerServicesState>(
      buildWhen: (previous, current) =>
          current.maybeWhen(
            askEngineerServiceDetailsLoading: () => true,
            askEngineerServiceDetailsSuccess: (_) => true,
            askEngineerServiceDetailsFailure: (_) => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return state.maybeWhen(
          askEngineerServiceDetailsLoading: () =>
              SizedBox(
                height: MediaQuery
                    .sizeOf(context)
                    .height * 0.5,
                child:
                AppCustomLoadingIndicator(
                  loadingColor: AppColors.primaryColor,
                ),
              ),
          askEngineerServiceDetailsSuccess: (askEngineer) {
            final askEngineerData = askEngineer.data;
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
                        AskEngineerTabViewItemTitle(
                          projectName: askEngineerData.projectName ?? 'N/A',
                        ),
                        FilterImageAndNameWidget(
                          imageUrl: askEngineerData.user?.personalPhoto,
                          userName: askEngineerData.user?.username,
                          timeAgo: formatDate(askEngineerData.createdDate),
                        ),
                        ProjectDetailsItemValue(
                          itemTitle:
                          AppLocale.projectDetails.getString(context),
                          value: askEngineerData.projectDescription ?? 'N/A',
                        ),
                        ProjectDetailsGovernorateCityRow(
                          governorate:
                          askEngineerData.governorate?.name ?? 'N/A',
                          city: askEngineerData.city?.name ?? 'N/A',
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle: AppLocale.projectDeadline
                                    .getString(context),
                                value: formatDate(askEngineerData.deadline) ??
                                    'N/A',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                AppLocale.urgencyLevel.getString(context),
                                value:
                                askEngineerData.urgencyLevel?.name ?? 'N/A',
                              ),
                            ),
                          ],
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.budget.getString(context),
                          value:
                          '${askEngineerData.budget} ${AppLocale.egp.getString(
                              context)}',
                        ),
                        if (askEngineerData.photos != null &&
                            askEngineerData.photos!.isNotEmpty)
                          ProjectDetailsPhotosListView(
                            photos: askEngineerData.photos,
                          ),
                      ],
                    ),
                  ),
                ),

                ///Add Offer
                AddOfferAskEngineerButton(
                  requestCount: askEngineerData.requestCount,
                  askId: askEngineerData.id ?? 0,
                ),
              ],
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
