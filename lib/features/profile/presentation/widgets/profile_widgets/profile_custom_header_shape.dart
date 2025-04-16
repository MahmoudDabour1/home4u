import 'package:flutter/material.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_upper_buttons.dart';

import '../../../../../core/routing/router_observer.dart';
import '../../../../auth/widgets/custom_header_shape.dart';

class ProfileCustomHeaderShape extends StatelessWidget {
  final EngineeringOfficeProfileResponseModel? profileCachedData;
  const ProfileCustomHeaderShape({super.key,this.profileCachedData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomHeaderShape(
          isImage: true,
          imageUrl:
          profileCachedData?.data?.user?.coverPhoto??"",
        ),
        ProfileUpperButtons(),
      ],
    );
  }
}
