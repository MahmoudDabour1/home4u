import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/certifications/get_certifications_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certification_menu_and_dialog.dart';

import '../../../logic/profile/profile_cubit.dart';
import '../../../logic/profile/profile_state.dart';

class CertificationsGridViewItem extends StatelessWidget {
  final CertificationsData? certificationsData;

  const CertificationsGridViewItem({super.key, this.certificationsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: FancyShimmerImage(
                imageUrl:
                    "https://dynamic-mouse-needlessly.ngrok-free.app/api/v1/file/download?fileName=${certificationsData!.imagePath}",
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.5,
                boxFit: BoxFit.fill,
                shimmerBaseColor: Colors.grey[300]!,
                shimmerHighlightColor: Colors.grey[100]!,
                shimmerBackColor: Colors.grey[100]!,
                errorWidget: const Center(child: Icon(Icons.error)),
                alignment: Alignment.center,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            CertificationMenuAndDialog(
              certificationId: certificationsData!.id ?? 0,
            ),
            // ProjectBottomRatingWidget(),
          ],
        );
      },
    );
  }
}
