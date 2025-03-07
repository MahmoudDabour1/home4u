import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../data/models/product_material_model.dart';
import '../../../../../locale/app_locale.dart';


class AddProductMaterialsAndSpecs extends StatefulWidget {
  const AddProductMaterialsAndSpecs({super.key});

  @override
  State<AddProductMaterialsAndSpecs> createState() =>
      _AddProductMaterialsAndSpecsState();
}

class _AddProductMaterialsAndSpecsState extends State<AddProductMaterialsAndSpecs> {
  List<ProductMaterialModel> productMaterials = [
    ProductMaterialModel(
        id: 1, nameEn: "Wood", nameAr: "خشب", code: "1", statusCode: 1),
    ProductMaterialModel(
        id: 2, nameEn: "Metal", nameAr: "معدن", code: "2", statusCode: 1),
    ProductMaterialModel(
        id: 3, nameEn: "Plastic", nameAr: "بلاستيك", code: "3", statusCode: 1),
    ProductMaterialModel(
        id: 4, nameEn: "Glass", nameAr: "زجاج", code: "4", statusCode: 1),
    ProductMaterialModel(
        id: 5, nameEn: "Fabric", nameAr: "قماش", code: "5", statusCode: 1),
    ProductMaterialModel(
        id: 6, nameEn: "Leather", nameAr: "جلد", code: "6", statusCode: 1),
    ProductMaterialModel(
        id: 7, nameEn: "Ceramic", nameAr: "خزف", code: "7", statusCode: 1),
  ];

  List<ProductMaterialModel> selectedMaterials = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing : 16.h,
      children: [
        AppCustomDropDownMultiSelectButton(
          isEnabled: true,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Please select at least one material";
            }
            return null;
          },
          selectedValues: selectedMaterials.map((e) => e.nameEn).toList(),
          items: productMaterials.map((material) => material.nameEn).toList(),
          labelText: "Select Materials",
          onChanged: (List<String> values) {
            setState(() {
              selectedMaterials = productMaterials
                  .where((material) => values.contains(material.nameEn))
                  .toList();
            });
          },
          onSaved: (value) {
            selectedMaterials = productMaterials
                .where((material) => value?.contains(material.nameEn) ?? false)
                .toList();
          },
        ),
        UpDownFormField(
          label: AppLocale.dimensionLength.getString(context),
          controller: TextEditingController(),
          focusNode: FocusNode(),
          validationMessage: "Please enter a valid length",
        ),
        UpDownFormField(
          label: AppLocale.dimensionWidth.getString(context),
          controller: TextEditingController(),
          focusNode: FocusNode(),
          validationMessage: "Please enter a valid width",
        ),
        UpDownFormField(
          label: AppLocale.dimensionHeight.getString(context),
          controller: TextEditingController(),
          focusNode: FocusNode(),
          validationMessage: "Please enter a valid height",
        ),
      ],
    );
  }
}
