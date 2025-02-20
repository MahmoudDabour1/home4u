import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certifications_bloc_builder.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/widgets/app_custom_add_button.dart';
import '../../../../../locale/app_locale.dart';

class CertificationsBody extends StatefulWidget {
  const CertificationsBody({super.key});

  @override
  State<CertificationsBody> createState() => _CertificationsBodyState();
}

class _CertificationsBodyState extends State<CertificationsBody> {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await context.read<CertificationsCubit>().getAllCertifications();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await context.read<CertificationsCubit>().getAllCertifications();
    _refreshController.loadComplete();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomAddButton(
          text: AppLocale.addCertification.getString(context),
          onPressed: () {
            context.pushNamed(Routes.addCertificationScreen);
          },
        ),
        Expanded(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header:
            ClassicHeader(
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: CertificationsBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
