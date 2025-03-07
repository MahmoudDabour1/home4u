import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/select_image_widget.dart';

class AddProductImages extends StatefulWidget {
  const AddProductImages({super.key});

  @override
  State<AddProductImages> createState() => _AddProductImagesState();
}

class _AddProductImagesState extends State<AddProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        SelectImageWidget(
          cubit: null,
          images: [],
        ),
      ],
    );
  }
}
