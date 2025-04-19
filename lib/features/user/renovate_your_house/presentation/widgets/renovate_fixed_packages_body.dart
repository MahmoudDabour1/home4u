import 'package:flutter/cupertino.dart';
import 'package:home4u/core/utils/spacing.dart';

import 'fixed_packages/fixed_package_list_view.dart';

class RenovateFixedPackagesBody extends StatelessWidget {
  const RenovateFixedPackagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(16),
          FixedPackageListView(),
          verticalSpace(32),
        ],
      ),
    );
  }
}
