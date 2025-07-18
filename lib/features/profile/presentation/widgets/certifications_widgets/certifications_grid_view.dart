import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/certifications/get_certifications_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certifications_grid_view_item.dart';
import 'package:lottie/lottie.dart';

class CertificationsGridView extends StatelessWidget {
  final List<CertificationsData?> certificationsList;
  const CertificationsGridView({super.key, required this.certificationsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (certificationsList.isEmpty ?? true)
          Lottie.asset(
            "assets/jsons/empty_list.json",
            height: 200.h,
          )
        else
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 1 / 1,
            ),
            itemCount: certificationsList.length,
            itemBuilder: (context, index) {
              return CertificationsGridViewItem(
                certificationsData: certificationsList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
