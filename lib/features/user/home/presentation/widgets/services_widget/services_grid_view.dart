import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_grid_view_item.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../data/models/services_model.dart';

class ServicesGridView extends StatelessWidget {
  const ServicesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServicesModel> serviceOptions = [
      ServicesModel(
        title: AppLocale.furnishTitle.getString(context),
        subtitle: AppLocale.furnishSubtitle.getString(context),
        icon: AppAssets.furnishYourHomeIcon,
        onPressed: () {
          context.pushNamed(Routes.furnishYourHomeScreen);
        },
      ),
      ServicesModel(
        title: AppLocale.requestDesign.getString(context),
        subtitle: AppLocale.requestDesignSubtitle.getString(context),
        icon: AppAssets.requestDesignIcon,
        onPressed: () {
          context.pushNamed(Routes.requestDesignScreen);
        },
      ),
      ServicesModel(
        title: AppLocale.kitchensTitle.getString(context),
        subtitle: AppLocale.kitchensSubtitle.getString(context),
        icon: AppAssets.kitchensAndDressingIcon,
        onPressed: () {
          context.pushNamed(Routes.kitchenAndDressingScreen);
        },
      ),
      ServicesModel(
        title: AppLocale.renovateTitle.getString(context),
        subtitle: AppLocale.renovateSubtitle.getString(context),
        icon: AppAssets.renovateYourHomeIcon,
        onPressed: () {
          context.pushNamed(Routes.renovateYourHouseScreen);
        },
      ),
      ServicesModel(
        title: AppLocale.engineerTitle.getString(context),
        subtitle: AppLocale.engineerSubtitle.getString(context),
        icon: AppAssets.askEngineerIcon,
        onPressed: () {
          context.pushNamed(Routes.askEngineerScreen);
        },
      ),
      ServicesModel(
        title: AppLocale.technicalTitle.getString(context),
        subtitle: AppLocale.technicalSubtitle.getString(context),
        icon: AppAssets.askTechnicalWorkerIcon,
        onPressed: () {
          context.pushNamed(Routes.askTechnicalScreen);
        },
      ),
      ServicesModel(
        title: AppLocale.shopNowTitle.getString(context),
        subtitle: AppLocale.shopSubtitle.getString(context),
        icon: AppAssets.shopNowIcon,
        onPressed: () {
          context.pushNamed(Routes.cartScreen);
        },
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 6.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1.4 / 2.1,
      ),
      itemCount: serviceOptions.length,
      itemBuilder: (context, index) {
        return ServicesGridViewItem(
          imageUrl: serviceOptions[index].icon,
          subTitle: serviceOptions[index].subtitle,
          title: serviceOptions[index].title,
          onPressed: serviceOptions[index].onPressed,
        );
      },
    );
  }
}
