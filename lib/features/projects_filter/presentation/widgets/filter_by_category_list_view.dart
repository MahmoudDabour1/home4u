import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/filter_by_category_item.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../locale/app_locale.dart';
import 'filter_show_renovate_items.dart';

class FilterByCategoryListView extends StatefulWidget {
  const FilterByCategoryListView({super.key});

  @override
  State<FilterByCategoryListView> createState() =>
      _FilterByCategoryListViewState();
}

class _FilterByCategoryListViewState extends State<FilterByCategoryListView> {
  int selectedIndex = 0;
  bool showRenovateTabs = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filtersOptions = [
      {
        "title": "All",
        "icon": AppAssets.totalIconSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = false;
          });
        },
      },
      {
        "title": AppLocale.furnishTitle.getString(context),
        "icon": AppAssets.homeSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = false;
          });
        },
      },
      {
        "title": AppLocale.requestDesign.getString(context),
        "icon": AppAssets.requestDesignSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = false;
          });
        },
      },
      {
        "title": AppLocale.kitchensTitle.getString(context),
        "icon": AppAssets.kitchensSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = false;
          });
        },
      },
      {
        "title": AppLocale.renovateTitle.getString(context),
        "icon": AppAssets.renovateSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = true;
          });
        },
      },
      {
        "title": AppLocale.engineerTitle.getString(context),
        "icon": AppAssets.askEngineerSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = false;
          });
        },
      },
      {
        "title": AppLocale.technicalTitle.getString(context),
        "icon": AppAssets.askTechnicalSvg,
        "onPressed": () {
          setState(() {
            showRenovateTabs = false;
          });
        },
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: filtersOptions.length,
            separatorBuilder: (_, __) => horizontalSpace(8),
            itemBuilder: (context, index) {
              return FilterByCategoryItem(
                title: filtersOptions[index]['title'],
                iconSvg: filtersOptions[index]['icon'],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  filtersOptions[index]['onPressed']();
                },
              );
            },
          ),
        ),
        verticalSpace(16),
        if (showRenovateTabs)
          FilterShowRenovateItems()
      ],
    );
  }
}
