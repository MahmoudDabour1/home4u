import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/helpers/shared_pref_keys.dart';
import 'core/routing/app_router.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/hive_set_up.dart';
import 'firebase_options.dart';
import 'home4u_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await initHive();
  await checkIfLoggedInUser();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterLocalization.instance.ensureInitialized();
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

checkIfLoggedInUser() async {
  String userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else{
    isLoggedInUser = false;
  }
}