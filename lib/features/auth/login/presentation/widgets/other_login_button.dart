import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';

class OtherLoginButton extends StatelessWidget {
  const OtherLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
height: 56.h,
      child: Row(
        children: [
          Image.asset("",height:32.h ,width: 32.w,),
          Text("Continuo with Google",style: AppStyles.font16DarkBlueBold,),
        ],
      ),
    );
  }
}
