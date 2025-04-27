import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../about_widgets/about_body.dart';
import '../certifications_widgets/certifications_body.dart';
import '../projects_widgets/projects_body.dart';
import '../services_widget/services_body.dart';

class ProfileTapBarViewBody extends StatelessWidget {
  const ProfileTapBarViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TabBarView(
        children: [
          ProjectsBody(),
          ServicesBody(),
          AboutBody(),
          CertificationsBody(),
        ],
      ),
    );
  }
}
