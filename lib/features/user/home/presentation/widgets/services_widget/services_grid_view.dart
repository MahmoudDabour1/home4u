import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_grid_view_item.dart';
import 'package:home4u/locale/app_locale.dart';

class ServicesGridView extends StatelessWidget {
  const ServicesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> serviceOptions = [
      {
        "title": AppLocale.furnishTitle.getString(context),
        "subtitle": AppLocale.furnishSubtitle.getString(context),
        "icon": AppAssets.homeSvg,
        "onPressed": () {
          context.pushNamed(Routes.furnishYourHomeScreen);
        },
      },
      {
        "title": AppLocale.requestDesignTitle.getString(context),
        "subtitle": AppLocale.requestDesignSubtitle.getString(context),
        "icon": AppAssets.requestDesignSvg,
        "onPressed": () => context.pushNamed(Routes.requestDesignScreen),
      },
      {
        "title": AppLocale.kitchensTitle.getString(context),
        "subtitle": AppLocale.kitchensSubtitle.getString(context),
        "icon": AppAssets.kitchensSvg,
        "onPressed": () {
          context.pushNamed(Routes.kitchenAndDressingScreen);

        },
      },
      {
        "title": AppLocale.renovateTitle.getString(context),
        "subtitle": AppLocale.renovateSubtitle.getString(context),
        "icon": AppAssets.renovateSvg,
        "onPressed": () => context.pushNamed(Routes.renovateYourHouseScreen),
      },
      {
        "title": AppLocale.engineerTitle.getString(context),
        "subtitle": AppLocale.engineerSubtitle.getString(context),
        "icon": AppAssets.askEngineerSvg,
        "onPressed": () => context.pushNamed(Routes.askEngineerScreen),
      },
      {
        "title": AppLocale.technicalTitle.getString(context),
        "subtitle": AppLocale.technicalSubtitle.getString(context),
        "icon": AppAssets.askTechnicalSvg,
        "onPressed": () => context.pushNamed(Routes.askTechnicalScreen),
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1 / 1,
      ),
      itemCount: serviceOptions.length,
      itemBuilder: (context, index) {
        return ServicesGridViewItem(
          imageUrl: serviceOptions[index]["icon"]!,
          subTitle: serviceOptions[index]["subtitle"]!,
          title: serviceOptions[index]["title"]!,
          onPressed: serviceOptions[index]["onPressed"]!,
        );
      },
    );
  }
}
