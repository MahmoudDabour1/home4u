import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certifications_body.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_upper_widget.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_body.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_body.dart';
import 'package:home4u/features/profile/presentation/widgets/tap_bar_widget.dart';

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
    context.read<ProjectCubit>().getProjects();
    context.read<CertificationsCubit>().getAllCertifications();
    context.read<ProfileCubit>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure the mixin is called
    return DefaultTabController(
      length: 4, // Same as the number of tabs
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
            body: TapBarViewBody(),
          ),
        ),
      ),
    );
  }
}

class TapBarViewBody extends StatelessWidget {
  const TapBarViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TabBarView(
        children: const [
          ProjectsBody(),
          ServicesBody(),
          Center(child: Text("Pricing Content")),
          CertificationsBody(),
        ],
      ),
    );
  }
}
