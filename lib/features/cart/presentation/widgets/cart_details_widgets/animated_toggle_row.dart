// class AnimatedToggleRow extends StatefulWidget {
//   const AnimatedToggleRow({super.key});
//
//   @override
//   State<AnimatedToggleRow> createState() => _AnimatedToggleRowState();
// }
//
// class _AnimatedToggleRowState extends State<AnimatedToggleRow>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool showFirst = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//     _startToggleLoop();
//   }
//
//   void _startToggleLoop() async {
//     while (mounted) {
//       await Future.delayed(const Duration(seconds: 3));
//       if (!mounted) return;
//       await _controller.forward();
//       if (!mounted) return;
//       setState(() => showFirst = !showFirst);
//       _controller.reset();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.h,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           // First item - animates up to top when hiding
//           if (showFirst)
//             Positioned(
//               child: SlideTransition(
//                 position: Tween<Offset>(
//                   begin: Offset.zero,
//                   end: const Offset(0, -1),
//                 ).animate(_animation),
//                 child: _buildRow("MMMMMMM"),
//               ),
//             ),
//
//           // Second item - animates up from bottom when showing
//           if (!showFirst)
//             Positioned(
//               child: SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(0, 1),
//                   end: Offset.zero,
//                 ).animate(_animation),
//                 child: _buildRow("NNNNNNN"),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRow(String text) {
//     return Row(
//       children: [
//         const Icon(Icons.star, color: Colors.amber),
//         horizontalSpace(8),
//         Text(
//           text,
//           style: AppStyles.font16BlackMedium,
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

//fade
// class AnimatedToggleRow extends StatefulWidget {
//   const AnimatedToggleRow({super.key});
//
//   @override
//   State<AnimatedToggleRow> createState() => _AnimatedToggleRowState();
// }
//
// class _AnimatedToggleRowState extends State<AnimatedToggleRow>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool showFirst = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );
//
//     _startToggleLoop();
//   }
//
//   void _startToggleLoop() async {
//     while (mounted) {
//       await Future.delayed(const Duration(seconds: 3));
//       if (mounted) {
//         await _controller.forward();
//         if (mounted) {
//           setState(() {
//             showFirst = !showFirst;
//           });
//         }
//         _controller.reset();
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.h,
//       child: Stack(
//         children: [
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 600),
//             transitionBuilder: (Widget child, Animation<double> animation) {
//               final offsetAnimation = Tween<Offset>(
//                 begin: const Offset(0, 1.0),
//                 end: Offset.zero,
//               ).animate(animation);
//               return SlideTransition(
//                 position: offsetAnimation,
//                 child: child,
//               );
//             },
//             child: showFirst
//                 ? _buildRow(
//                     text: "#1 on apple devices",
//                     icon: Container(
//                       decoration: BoxDecoration(
//                         color: AppColors.secondaryColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.star,
//                         color: AppColors.whiteColor,
//                         size: 30.r,
//                       ),
//                     ),
//                     key: const ValueKey(1))
//                 : _buildRow(
//                     icon: Icon(
//                       Icons.delivery_dining_rounded,
//                       color: AppColors.lightBlueColor,
//                       size: 30.r,
//                     ),
//                     text: "Free Delivery",
//                     key: const ValueKey(2)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRow(
//       {required String text, required Widget icon, required Key key}) {
//     return KeyedSubtree(
//       key: key,
//       child: Row(
//         children: [
//           icon,
//           horizontalSpace(8),
//           Text(
//             text,
//             style: AppStyles.font16BlackBold,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

//option2

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class AnimatedToggleRow extends StatefulWidget {
  final String textOne;

  // final String textTwo;
  final double? iconSize;
  final TextStyle? textStyle;

  const AnimatedToggleRow(
      {super.key, required this.textOne, this.iconSize, this.textStyle});

  @override
  State<AnimatedToggleRow> createState() => _AnimatedToggleRowState();
}

class _AnimatedToggleRowState extends State<AnimatedToggleRow> {
  bool showFirst = true;
  Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   _toggleRows();
  // }
  //
  // void _toggleRows() async {
  //   while (mounted) {
  //     await Future.delayed(const Duration(seconds: 3));
  //     setState(() {
  //       showFirst = !showFirst;
  //     });
  //   }
  // }


  @override
  void initState() {
    super.initState();
    _startToggleTimer(); // Initialize the timer
  }

  void _startToggleTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) { // Check if widget is still mounted
        setState(() {
          showFirst = !showFirst;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, 0.4),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: showFirst
          ? _buildRow(
              text: widget.textOne,
              icon: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.star,
                  color: AppColors.whiteColor,
                  size: widget.iconSize ?? 30.r,
                ),
              ),
              key: const ValueKey(1))
          : _buildRow(
              icon: Icon(
                Icons.delivery_dining_rounded,
                color: AppColors.lightBlueColor,
                size: widget.iconSize ?? 30.r,
              ),
              text: AppLocale.freeDelivery.getString(context),
              key: const ValueKey(2)),
    );
  }

  Widget _buildRow(
      {required String text, required Widget icon, required Key key}) {
    return KeyedSubtree(
      key: key,
      child: Row(
        children: [
          icon,
          horizontalSpace(8),
          Expanded(

            child: AutoSizeText(
              text,
              style: widget.textStyle ?? AppStyles.font16BlackBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
////////////////////////////////////////
// class AnimatedToggleRow extends StatefulWidget {
//   const AnimatedToggleRow({super.key});
//
//   @override
//   State<AnimatedToggleRow> createState() => _AnimatedToggleRowState();
// }
//
// class _AnimatedToggleRowState extends State<AnimatedToggleRow> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation1;
//   late Animation<Offset> _offsetAnimation2;
//   bool showFirst = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//
//     _initAnimations();
//     _startToggleLoop();
//   }
//
//   void _initAnimations() {
//     _offsetAnimation1 = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(0, -1),
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//
//     _offsetAnimation2 = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }
//
//   void _startToggleLoop() async {
//     while (mounted) {
//       await Future.delayed(const Duration(seconds: 3));
//       await _controller.forward();
//       setState(() {
//         showFirst = !showFirst;
//       });
//       _controller.reset();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40.h,
//       child: Stack(
//         alignment: Alignment.centerLeft,
//         children: [
//           if (showFirst)
//             SlideTransition(
//               position: _offsetAnimation1,
//               child: _buildRow("MMMMMMM"),
//             )
//           else
//             SlideTransition(
//               position: _offsetAnimation2,
//               child: _buildRow("NNNNNNN"),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRow(String text) {
//     return Row(
//       children: [
//         const Icon(Icons.star, color: Colors.amber),
//         horizontalSpace(8),
//         Text(
//           text,
//           style: AppStyles.font16BlackMedium,
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
