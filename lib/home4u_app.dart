import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home4u/core/routing/app_router.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import 'core/di/dependency_injection.dart';
import 'core/theming/app_theme.dart';
import 'features/auth/forget_password/logic/forget_password_cubit.dart';

class Home4uApp extends StatelessWidget {
  final AppRouter appRouter;

  const Home4uApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(create: (_) => sl<SignUpCubit>()),
        BlocProvider<ForgetPasswordCubit>(
          create: (_) => sl<ForgetPasswordCubit>(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Home4u App',
          theme: appTheme,
          builder: FToastBuilder(),
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [NavigatorObserver()],
          initialRoute: Routes.profileScreen,
        ),
      ),
    );
  }
}
