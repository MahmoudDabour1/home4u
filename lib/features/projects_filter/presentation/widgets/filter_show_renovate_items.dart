import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';

import '../../../../core/utils/spacing.dart';

class FilterShowRenovateItems extends StatefulWidget {
  const FilterShowRenovateItems({super.key});

  @override
  State<FilterShowRenovateItems> createState() => _FilterShowRenovateItemsState();
}

class _FilterShowRenovateItemsState extends State<FilterShowRenovateItems> {
  int selectedRenovateTabIndex = 0;

  final List<Map<String, dynamic>> renovateTabs = [
    {"title": "ربع تشطيب"},
    {"title": "نص تشطيب"},
    {"title": "كامل تشطيب"},
  ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: renovateTabs.length,
            separatorBuilder: (_, __) => horizontalSpace(8),
            itemBuilder: (context, index) {
              final tab = renovateTabs[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRenovateTabIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: selectedRenovateTabIndex == index
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.transparent,
                    border: Border.all(
                      color: selectedRenovateTabIndex == index
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      tab['title']!,
                      style:AppStyles.font14BlackMedium,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
