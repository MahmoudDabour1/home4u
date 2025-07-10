// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/theming/app_styles.dart';
//
// class ExpandableText extends StatefulWidget {
//   final String text;
//   final TextStyle? textStyle;
//   final int? maxLines;
//   final ValueChanged<bool>? onExpansionChanged;
//   final bool isArrow = false;
//
//   const ExpandableText({
//     super.key,
//     required this.text,
//     this.textStyle,
//     this.maxLines,
//     this.onExpansionChanged,
//   });
//
//   @override
//   State<ExpandableText> createState() => _ExpandableTextState();
// }
//
// class _ExpandableTextState extends State<ExpandableText> {
//   bool isExpanded = false;
//   bool showReadMore = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final span = TextSpan(
//             text: widget.text,
//             style: widget.textStyle ?? AppStyles.font16BlackLight);
//         final tp = TextPainter(
//           text: span,
//           maxLines: isExpanded ? null : widget.maxLines?? 4,
//           textDirection: TextDirection.ltr,
//         );
//         tp.layout(maxWidth: constraints.maxWidth);
//
//         showReadMore = tp.didExceedMaxLines;
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.text,
//               style: widget.textStyle ?? AppStyles.font16BlackLight,
//               maxLines: isExpanded ? null :widget.maxLines?? 4,
//               overflow: TextOverflow.fade,
//               textAlign: TextAlign.start,
//             ),
//             if (showReadMore)
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isExpanded = !isExpanded;
//                   });
//                   widget.onExpansionChanged?.call(isExpanded);
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 4.h),
//                   child: Text(
//                     isExpanded ? 'Show Less' : 'Read More',
//                     style: AppStyles.font16BlackLight.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';

import '../../../../../core/theming/app_styles.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final int maxLines;
  final ValueChanged<bool>? onExpansionChanged;
  final bool isArrow;

  const ExpandableText({
    super.key,
    required this.text,
    this.textStyle,
    this.maxLines = 4,
    this.onExpansionChanged,
    this.isArrow = false,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  bool showReadMore = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: widget.text,
          style: widget.textStyle ?? AppStyles.font16BlackLight,
        );

        final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        showReadMore = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedCrossFade(
              firstChild: Text(
                widget.text,
                maxLines: widget.maxLines,
                overflow: TextOverflow.ellipsis,
                style: widget.textStyle ?? AppStyles.font16BlackLight,
              ),
              secondChild: Text(
                widget.text,
                style: widget.textStyle ?? AppStyles.font16BlackLight,
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
            if (showReadMore)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                  widget.onExpansionChanged?.call(isExpanded);
                },
                child: widget.isArrow
                    ? Row(
                      children: [
                        Spacer(),
                        Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColors.grayColor,
                            size: 40.r,
                          ),
                      ],
                    )
                    : Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isExpanded ? 'Show Less' : 'Read More',
                              style: AppStyles.font16BlackLight.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            // if (widget.isArrow)
                            //   Icon(
                            //     isExpanded
                            //         ? Icons.keyboard_arrow_up
                            //         : Icons.keyboard_arrow_down,
                            //     color: Colors.blue,
                            //     size: 20,
                            //   ),
                          ],
                        ),
                      ),
              ),
          ],
        );
      },
    );
  }
}
