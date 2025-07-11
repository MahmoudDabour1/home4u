import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/products/data/models/business_config_model.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/utils/app_constants.dart';

class BusinessTypesWidget extends StatefulWidget {
  const BusinessTypesWidget({super.key});

  @override
  State<BusinessTypesWidget> createState() => _BusinessTypesWidgetState();
}

class _BusinessTypesWidgetState extends State<BusinessTypesWidget> {
  final List<BusinessType> businessTypes = [];

  Future<void> _loadBusinessType() async {
    final appInitBox =
        await Hive.openBox<BusinessConfigModel>(kBusinessConfigBox);
    final appInitData = appInitBox.get(kBusinessConfigData);
    if (appInitData?.data?.businessTypes == null) {
      context.read<ProductsCubit>().getBusinessConfig().then((value) {
        setState(() {
          businessTypes.clear();
          if (appInitData != null) {
            businessTypes.addAll(appInitData.data?.businessTypes ?? []);
          }
        });
      });
    } else {
      setState(() {
        businessTypes.clear();
        if (appInitData != null) {
          businessTypes.addAll(appInitData.data?.businessTypes ?? []);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadBusinessType();
  }

  List<String> businessTypeImages = [
    AppAssets.furnitureImage,
    AppAssets.kitchensImage,
    AppAssets.electricalTools,
    AppAssets.furnishings,
    AppAssets.paintMaterials,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.shopByCategory.getString(context),
            style: AppStyles.font16BlackBold,
          ),
          verticalSpace(16),
          SizedBox(
            height: 130.h,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      context.pushNamed(Routes.cartScreen,arguments: index);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40.r),
                            child: Image.asset(
                              businessTypeImages[index],
                              height: 80.h,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 80.w,
                            child: AutoSizeText(
                              (businessTypes.length > index &&
                                      businessTypes[index].name != null)
                                  ? businessTypes[index].name!
                                  : "",
                              style: AppStyles.font14BlackMedium,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
