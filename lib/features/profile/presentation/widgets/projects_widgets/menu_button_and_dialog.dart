import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';

import '../../../../../core/helpers/helper_methods.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/widgets/app_custom_drop_down_search_menu.dart';
import '../../../logic/profile/profile_state.dart';
import 'delete_alert_dialog.dart';

class MenuButtonAndDialog extends StatelessWidget {
  final int projectId;

  const MenuButtonAndDialog({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h, left: 10.w),
          child: AppCustomDropDownSearchMenu(
            icon: AppAssets.menuSvgImage,
            onItemSelected: (value) {
              if (value == "delete") {
                showDialog(
                  context: context,
                  builder: (context) => ProjectsDeleteAlertDialog(
                    projectId: projectId,
                  ),
                );
              }
              if (value == "edit") {
                showToast(message: "edit");
              }
            },
          ),
        );
      },
    );
  }
}
