import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/routing/app_router.dart';

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
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [NavigatorObserver()],
        initialRoute: '/',
      ),
    );
  }
}
