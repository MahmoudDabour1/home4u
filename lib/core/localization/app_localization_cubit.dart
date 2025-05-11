import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../locale/app_locale.dart';
import '../helpers/shared_pref_helper.dart';
import '../helpers/shared_pref_keys.dart';
import '../networking/dio_factory.dart';
import 'app_localization_state.dart';

class AppLocalizationCubit extends Cubit<AppLocalizationState> {
  final FlutterLocalization localization;

  AppLocalizationCubit(this.localization)
      : super(const AppLocalizationState.initial());

  void initializeLocaleWith(String initialLocale) {
    emit(AppLocalizationState.loaded(initialLocale));
    localization.translate(initialLocale);
    DioFactory.updateLanguageHeader(initialLocale);

    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.en),
        const MapLocale('ar', AppLocale.ar),
      ],
      initLanguageCode: initialLocale,
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    if (locale != null) {
      emit(AppLocalizationState.loaded(locale.languageCode));
    }
  }

  void changeLocale(String localeCode) async {
    await SharedPrefHelper.setData(SharedPrefKeys.selectedLocale, localeCode);
    localization.translate(localeCode);
    emit(AppLocalizationState.loaded(localeCode));
    DioFactory.updateLanguageHeader(localeCode);
  }


  Map<String, dynamic> get appLocale {
    final state = this.state;
    if (state is LoadedLocale) {
      return state.locale == 'ar' ? AppLocale.ar : AppLocale.en;
    }
    return AppLocale.en;
  }

  TextDirection get textDirection {
    final state = this.state;
    if (state is LoadedLocale) {
      return state.locale == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    }
    return TextDirection.ltr;
  }
}