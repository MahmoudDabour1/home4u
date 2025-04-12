import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_tab_bar_view_body.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_upper_widget.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/tap_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    context.read<ProjectCubit>().getProjects();
    context.read<CertificationsCubit>().getAllCertifications();
    final String userType =
    await SharedPrefHelper.getString(SharedPrefKeys.userType);
    switch (userType) {
      case "ENGINEER":
        context.read<ProfileCubit>().getEngineerProfileData();
        break;
      case "TECHNICAL_WORKER":
        context.read<ProfileCubit>().getTechnicalWorkerProfileData();
        break;
      case "ENGINEERING_OFFICE":
        context.read<ProfileCubit>().getEngineeringOfficeProfileData();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: ProfileUpperWidget()),
                TapBarWidget(),
              ];
            },
            body: ProfileTapBarViewBody(),
          ),
        ),
      ),
    );
  }
}
