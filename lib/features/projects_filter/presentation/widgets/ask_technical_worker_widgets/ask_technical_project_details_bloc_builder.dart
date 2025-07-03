import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_custom_loading_indicator.dart';
import 'package:home4u/features/projects_filter/logic/project_details/project_details_cubit.dart';
import 'package:home4u/features/projects_filter/logic/project_details/project_details_state.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_technical_worker_widgets/ask_technical_tab_view_item_title.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/details/project_details_governorate_city_row.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/details/project_details_item_value.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/details/project_details_photos_list_view.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/filter_image_and_name_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

class AskTechnicalProjectDetailsBlocBuilder extends StatelessWidget {
  const AskTechnicalProjectDetailsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
      builder: (context, state) {
        return state.maybeWhen(
          askTechnicalDetailsLoading: () => SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: AppCustomLoadingIndicator(
              loadingColor: AppColors.primaryColor,
            ),
          ),
          askTechnicalDetailsSuccess: (data) {
            final askTechnical = data.data;
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
                        AskTechnicalTabViewItemTitle(
                          projectName: askTechnical.projectName ?? 'N/A',
                        ),
                        FilterImageAndNameWidget(
                          imageUrl: askTechnical.user?.personalPhoto,
                          userName: askTechnical.user?.username,
                          timeAgo: formatDate(askTechnical.createdDate),
                        ),
                        ProjectDetailsItemValue(
                          itemTitle:
                              AppLocale.projectDetails.getString(context),
                          value: askTechnical.projectDescription ?? 'N/A',
                        ),
                        ProjectDetailsGovernorateCityRow(
                          governorate: askTechnical.governorate?.name ?? 'N/A',
                          city: askTechnical.city?.name ?? 'N/A',
                        ),
                        ProjectDetailsItemValue(
                          itemTitle:
                              AppLocale.materialNeeded.getString(context),
                          value: askTechnical.material?.name ?? 'N/A',
                        ),
                        ProjectDetailsItemValue(
                          itemTitle: AppLocale.budget.getString(context),
                          value:
                              '${askTechnical.budget} ${AppLocale.egp.getString(context)}',
                        ),
                        if (askTechnical.photos != null &&
                            askTechnical.photos!.isNotEmpty)
                          ProjectDetailsPhotosListView(
                            photos: askTechnical.photos,
                          ),
                      ],
                    ),
                  ),
                ),
                askTechnical.requestCount == 0
                    ? SizedBox.shrink()
                    : Text(
                        "${AppLocale.offersCount.getString(context)} (${(askTechnical.requestCount ?? 0).toString()})",
                        style: AppStyles.font16BlackMedium,
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
