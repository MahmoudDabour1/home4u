import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_cubit.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_state.dart';

import '../../../../../core/widgets/select_image_widget.dart';

class AddProductImages extends StatefulWidget {
  const AddProductImages({super.key});

  @override
  State<AddProductImages> createState() => _AddProductImagesState();
}

class _AddProductImagesState extends State<AddProductImages> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessAddProductCubit, BusinessAddProductState>(
      builder: (context, state) {
        final businessCubit = context.read<BusinessAddProductCubit>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            SelectImageWidget(
              cubit: businessCubit,
              images: businessCubit.images,
            ),
            if (businessCubit.images.isNotEmpty)
              CarouselSlider(
                items: businessCubit.images.map((imageFile) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0).h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0).r,
                          image: DecorationImage(
                            image: FileImage(imageFile),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              businessCubit.images.remove(imageFile);
                              businessCubit.emit(BusinessAddProductState.selectImageSuccess(businessCubit.images)); // Emit state after removal
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 220.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.75,
                ),
              ),
            if (businessCubit.images.isEmpty)
              Center(
                child: Text(
                  'No images selected',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                ),
              ),
          ],
        );
      },
    );
  }
}
