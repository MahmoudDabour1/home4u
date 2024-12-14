import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_upper_widget.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_body.dart';
import 'package:home4u/features/profile/presentation/widgets/tap_bar_widget.dart';

import '../logic/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          Center(child: Text("Services Content")),
          Center(child: Text("Pricing Content")),
          Center(child: Text("Certifications Content")),
        ],
      ),
    );
  }
}
