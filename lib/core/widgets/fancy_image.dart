import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FancyImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const FancyImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: imagePath,
      width: width ?? MediaQuery.sizeOf(context).width * 0.5,
      height: height ?? MediaQuery.sizeOf(context).height * 0.5,
      boxFit: BoxFit.fill,
      shimmerBaseColor: Colors.grey[300]!,
      shimmerHighlightColor: Colors.grey[100]!,
      shimmerBackColor: Colors.grey[100]!,
      errorWidget: const Center(child: Icon(Icons.error)),
      alignment: Alignment.center,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
