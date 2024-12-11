import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'delete_dialog_button_widget.dart';
import 'menu_item.dart';

class MenuButtonAndDialog extends StatefulWidget {
  const MenuButtonAndDialog({super.key});

  @override
  State<MenuButtonAndDialog> createState() => _MenuButtonAndDialogState();
}

class _MenuButtonAndDialogState extends State<MenuButtonAndDialog> {
  bool _isDialogVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isDialogVisible = !_isDialogVisible;
              });
            },
            icon: SvgPicture.asset(
              AppAssets.menuSvgImage,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        if (_isDialogVisible)
          Positioned(
            top: 40.h,
            left: 10.w,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 104.w,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuItem(
                      text: AppStrings.delete,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              "Are you sure you want to delete this item?",
                              style: AppStyles.font16BlackMedium,
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Row(
                                children: [
                                  DeleteDialogButtonWidget(
                                    text: "Cancel",
                                    onPressed: () {
                                      context.pop();
                                    },
                                  ),
                                  horizontalSpace(16),
                                  DeleteDialogButtonWidget(
                                    text: "Delete",
                                    onPressed: () async {
                                      context.pop();
                                      await showToast(
                                          message: "Deleted Successfully");
                                    },
                                    isBoarder: true,
                                    backgroundColor: AppColors.whiteColor,
                                    textColor: AppColors.secondaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                        setState(() {
                          _isDialogVisible = false;
                        });
                      },
                      icon: AppAssets.deleteSvgImage,
                    ),
                    verticalSpace(8),
                    MenuItem(
                      text: AppStrings.edit,
                      onTap: () {
                        setState(() {
                          _isDialogVisible = false;
                        });
                      },
                      icon: AppAssets.editSvgImage,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
