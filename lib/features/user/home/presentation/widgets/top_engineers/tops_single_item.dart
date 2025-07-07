import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/networking/api_constants.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../cart/presentation/widgets/cart_details_widgets/animated_toggle_row.dart';

class TopsSingleItem extends StatefulWidget {
  final String image;
  final String firstName;
  final String lastName;
  final int userId;
  final String phone;
  final String email;
  final int yearsOfExperience;
  final String bio;
  final String governorate;
  final String city;
  final String type;

  const TopsSingleItem({
    super.key,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.phone,
    required this.email,
    required this.yearsOfExperience,
    required this.bio, required this.governorate, required this.city, required this.type,
  });

  @override
  State<TopsSingleItem> createState() => _TopsSingleItemState();
}

class _TopsSingleItemState extends State<TopsSingleItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.filledGrayColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.r),
                        child: Image.network(
                          '${ApiConstants.apiBaseUrl}/${widget.image}',
                          height: MediaQuery.sizeOf(context).height - 16.w,
                          width: MediaQuery.sizeOf(context).width - 16.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "${widget.firstName} ${widget.lastName}",
                    style: AppStyles.font16BlackMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Icon(Icons.phone,color: AppColors.darkGrayColor,size: 20.r,),
                      horizontalSpace(4),
                      Text(
                        widget.phone,
                        style: AppStyles.font16GrayMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.engineering,

                        color: AppColors.darkGrayColor,size: 20.r,),
                      horizontalSpace(4),
                      Expanded(
                        child: AutoSizeText(
                          widget.type,
                          style: AppStyles.font14BlackMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  AnimatedToggleRow(
                    textOne: "#${widget.yearsOfExperience} Years Of Experience",
                    textTwo: widget.bio,
                    iconSize: 20.r,
                    textStyle: AppStyles.font14BlackMedium,
                  ),
                    verticalSpace(8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
