import 'package:flutter/material.dart';

import '../../../../../core/utils/spacing.dart';
import 'order_container_loading_widget.dart';

class OrderLoadingStateWidget extends StatelessWidget {
  const OrderLoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => verticalSpace(20),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const OrderContainerLoadingWidget();
      },
    );
  }
}
