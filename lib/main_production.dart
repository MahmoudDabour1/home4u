import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/helpers/shared_pref_keys.dart';
import 'core/routing/app_router.dart';
import 'home4u_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  _setStatusBarColor();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final cachedLocale =
      await SharedPrefHelper.getString(SharedPrefKeys.selectedLocale);
  final initialLocale = cachedLocale.isNotEmpty ? cachedLocale : 'en';

  runApp(
    Home4uApp(
      appRouter: AppRouter(),
      initialLocale: initialLocale,
    ),
  );
}

void _setStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.red,
    ),
  );
}
