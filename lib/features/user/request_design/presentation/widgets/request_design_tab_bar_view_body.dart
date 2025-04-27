import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/request_design/presentation/widgets/request_design_custom_body.dart';
import 'package:home4u/features/user/request_design/presentation/widgets/request_design_with_ai_body.dart';

class RequestDesignTabBarViewBody extends StatelessWidget {
  const RequestDesignTabBarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).h,
      child: TabBarView(
        children: [
          RequestDesignCustomBody(),
          RequestDesignWithAiBody(),
        ],
      ),
    );
  }
}
