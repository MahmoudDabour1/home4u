import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home4u/core/localization/app_localization_state.dart';
import 'package:home4u/core/routing/app_router.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/services/services_cubit.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/helper_methods.dart';
import 'core/localization/app_localization_cubit.dart';
import 'core/theming/app_theme.dart';
import 'features/auth/forget_password/logic/forget_password_cubit.dart';
import 'features/auth/sign_up/logic/engineer/engineer_cubit.dart';
import 'features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'features/profile/logic/certifications/certifications_cubit.dart';
import 'features/profile/logic/project/project_cubit.dart';
import 'locale/app_locale.dart';

class Home4uApp extends StatefulWidget {
  final AppRouter appRouter;
  final String initialLocale;

  const Home4uApp({
    super.key,
    required this.appRouter,
    required this.initialLocale,
  });

  @override
  State<Home4uApp> createState() => _Home4uAppState();
}

class _Home4uAppState extends State<Home4uApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.en),
        const MapLocale('ar', AppLocale.ar),
      ],
      initLanguageCode: widget.initialLocale,
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    if (locale != null) {
      sl<AppLocalizationCubit>().changeLocale(locale.languageCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLocalizationCubit>(
            create: (_) => AppLocalizationCubit(localization)
              ..initializeLocaleWith(
                widget.initialLocale,
              )),
        BlocProvider<SignUpCubit>(create: (_) => sl<SignUpCubit>()),
        BlocProvider<ForgetPasswordCubit>(
            create: (_) => sl<ForgetPasswordCubit>()),
        BlocProvider<ProfileCubit>(create: (_) => sl<ProfileCubit>()),
        BlocProvider<ProjectCubit>(
            create: (_) => sl<ProjectCubit>()..getProjects()),
        BlocProvider<CertificationsCubit>(
            create: (_) => sl<CertificationsCubit>()),
        BlocProvider<ServicesCubit>(create: (_) => sl<ServicesCubit>()),
        BlocProvider<EngineerCubit>(
          create: (_) => sl<EngineerCubit>(),
        ),
        BlocProvider<TechnicalWorkerCubit>(
          create: (_) => sl<TechnicalWorkerCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        child: BlocBuilder<AppLocalizationCubit, AppLocalizationState>(
          builder: (context, state) {
            final TextDirection textDirection =
                context.read<AppLocalizationCubit>().textDirection;

            return Directionality(
              textDirection: textDirection,
              child: MaterialApp(
                title: 'Home4u App',
                theme: appTheme,
                navigatorKey: navigatorKey,
                supportedLocales: localization.supportedLocales,
                localizationsDelegates: localization.localizationsDelegates,
                builder: FToastBuilder(),
                locale: state is LoadedLocale
                    ? Locale(state.locale)
                    : Locale(widget.initialLocale),
                onGenerateRoute: widget.appRouter.generateRoute,
                debugShowCheckedModeBanner: false,
                navigatorObservers: [NavigatorObserver()],
                initialRoute: Routes.onBoardingScreen,
              ),
            );
          },
        ),
      ),
    );
  }
}
