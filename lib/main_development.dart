import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/utils/my_bloc_observer.dart';
import 'firebase_options.dart';
import 'home4u_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  // Hive.registerAdapter<GovernorateDataModel>(GovernorateDataModelAdapter());
  // await Hive.openBox<GovernorateDataModel>(kGovernoratesBox);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => Home4uApp(appRouter: AppRouter()),
    // ),
    Home4uApp(appRouter: AppRouter()),
  );
}
