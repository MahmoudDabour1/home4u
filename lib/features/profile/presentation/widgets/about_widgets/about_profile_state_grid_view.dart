import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/presentation/widgets/about_widgets/about_title_and_edit_row.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/utils/spacing.dart';
import 'about_profile_state_grid_view_item.dart';

class AboutProfileStateGridView extends StatelessWidget {
  AboutProfileStateGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(16),
        AboutTitleAndEditRow(
          onPressed: () {},
          title: AppLocale.profileStats.getString(context),
        ),
        verticalSpace(16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.2 / 1,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final stat = profileStats[index];
            return AboutProfileStateGridViewItem(
              title: stat.title,
              subTitle: stat.subTitle,
              imagePath: stat.imagePath,
            );
          },
        ),
      ],
    );
  }

  final List<ProfileStatItem> profileStats = [
    ProfileStatItem(
      title: '150K',
      subTitle: 'Followers',
      imagePath: AppAssets.followersSvg,
    ),
    ProfileStatItem(
      title: '4.9/5.0',
      subTitle: 'Total Rating',
      imagePath: AppAssets.starSvgImage,
    ),
    ProfileStatItem(
      title: '150K',
      subTitle: 'Likes',
      imagePath: AppAssets.heartOutlineSvg,
    ),
    ProfileStatItem(
      title: '32',
      subTitle: 'Completed Projects',
      imagePath: AppAssets.completeSvg,
    ),
  ];
}

class ProfileStatItem {
  final String title;
  final String subTitle;
  final String imagePath;

  ProfileStatItem({
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
}
