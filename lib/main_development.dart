import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/features/profile/data/data_sources/profile_local_data_source.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/helpers/shared_pref_keys.dart';
import 'core/routing/app_router.dart';
import 'core/utils/my_bloc_observer.dart';
import 'firebase_options.dart';
import 'home4u_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  // Hive.registerAdapter<GovernorateDataModel>(GovernorateDataModelAdapter());
  // await Hive.openBox<GovernorateDataModel>(kGovernoratesBox);
  await initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FlutterLocalization.instance.ensureInitialized();

  final cachedLocale =
      await SharedPrefHelper.getString(SharedPrefKeys.selectedLocale);
  final initialLocale = cachedLocale.isNotEmpty ? cachedLocale : 'en';

  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => Home4uApp(
    //     appRouter: AppRouter(),
    //     initialLocale: initialLocale,
    //   ),
    // ),
    Home4uApp(
      appRouter: AppRouter(),
      initialLocale: initialLocale,
    ),
  );
}
