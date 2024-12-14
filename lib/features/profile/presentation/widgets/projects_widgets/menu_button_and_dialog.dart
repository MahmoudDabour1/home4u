import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/features/profile/logic/profile_cubit.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_strings.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../logic/profile_state.dart';
import 'delete_alert_dialog.dart';
import 'menu_item.dart';

class MenuButtonAndDialog extends StatefulWidget {
  final int projectId;

  const MenuButtonAndDialog({super.key, required this.projectId});

  @override
  State<MenuButtonAndDialog> createState() => _MenuButtonAndDialogState();
}

class _MenuButtonAndDialogState extends State<MenuButtonAndDialog> {
  bool _isDialogVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
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
                              builder: (context) => DeleteAlertDialog(
                                projectId: widget.projectId,
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
      },
    );
  }
}
