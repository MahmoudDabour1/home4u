import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_localization_state.freezed.dart';

@freezed
class AppLocalizationState with _$AppLocalizationState {
  const factory AppLocalizationState.initial() = _Initial;
  const factory AppLocalizationState.loaded(String locale) = LoadedLocale;
}