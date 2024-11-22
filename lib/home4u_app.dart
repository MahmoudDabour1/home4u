import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/routing/app_router.dart';
import 'package:home4u/core/routing/routes.dart';

import 'core/theming/app_theme.dart';


class Home4uApp extends StatelessWidget {
  final AppRouter appRouter;
  const Home4uApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Home4u App',
        theme: appTheme,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [NavigatorObserver()],
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}
