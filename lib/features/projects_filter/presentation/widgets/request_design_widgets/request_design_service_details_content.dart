import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_cubit.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/request_design_widgets/request_design_tab_view_item_title.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_custom_loading_indicator.dart';
import '../../../../../locale/app_locale.dart';
import '../details/project_details_governorate_city_row.dart';
import '../details/project_details_item_value.dart';
import '../filter_image_and_name_widget.dart';
import 'add_offer_request_design_button.dart';

class RequestDesignServiceDetailsContent extends StatelessWidget {
  const RequestDesignServiceDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestDesignServicesCubit, RequestDesignServicesState>(
      buildWhen: (previous, current) => current.maybeWhen(
        requestDesignServiceDetailsLoading: () => true,
        requestDesignServiceDetailsSuccess: (_) => true,
        requestDesignServiceDetailsFailure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          requestDesignServiceDetailsLoading: () => SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppCustomLoadingIndicator(
                  loadingColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          requestDesignServiceDetailsSuccess: (requestDesign) {
            final requestDesignData = requestDesign.data;
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
                        RequestDesignTabViewItemTitle(
                          unitArea: requestDesignData.unitArea ?? 0.0,
                          unitType: requestDesignData.unitType?.name ?? 'N/A',
                        ),
                        FilterImageAndNameWidget(
                          imageUrl: requestDesignData.user?.personalPhoto,
                          userName: requestDesignData.user?.username,
                          timeAgo: formatDate(requestDesignData.createdDate),
                        ),
                        ProjectDetailsGovernorateCityRow(
                          governorate:
                              requestDesignData.governorate?.name ?? 'N/A',
                          city: null,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                    AppLocale.durationInDays.getString(context),
                                value: '${requestDesignData.requiredDuration}',
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ProjectDetailsItemValue(
                                itemTitle:
                                    AppLocale.unitArea.getString(context),
                                value: '${requestDesignData.unitArea}',
                              ),
                            ),
                          ],
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.budget.getString(context),
                          value:
                              '${requestDesignData.budget} ${AppLocale.egp.getString(context)}',
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.notes.getString(context),
                          value: requestDesignData.notes ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                ),
                AddOfferRequestDesignButton(
                  askId: requestDesignData.id ?? 0,
                  requestCount: requestDesignData.requestCount,
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
