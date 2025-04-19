import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_bloc_builder.dart';

import '../../../../../core/theming/app_colors.dart';

class ProfileUpperWidget extends StatelessWidget {
  const ProfileUpperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                // ProfileCustomHeaderShape(),
                ProfileBlocBuilder ()
              ],
            ),
            Divider(
              thickness: 2,
              color: AppColors.grayColor,
            ),
          ],
        );
      },
    );
  }
}
