import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/fancy_image.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../data/models/base/photo_base_model.dart';

class ProjectDetailsPhotosListView extends StatelessWidget {
  final List<PhotoBaseModel>? photos;

  const ProjectDetailsPhotosListView({
    super.key,
    required this.photos,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          AppLocale.projectImages.getString(context),
          style: AppStyles.font16BlackMedium,
        ),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: photos!.length,
            itemBuilder: (context, index) {
              return FancyImage(
                imagePath: ApiConstants.getImageBaseUrl(
                  photos![index].photoPath ?? '',
                ),
                height: 50.h,
                width: 100.w,
              );
            },
            separatorBuilder: (_, __) => horizontalSpace(8),
          ),
        ),
      ],
    );
  }
}
