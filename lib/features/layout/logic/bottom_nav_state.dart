import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_state.freezed.dart';


@freezed
class BottomNavState<T> with _$BottomNavState<T> {
  const factory BottomNavState.initial() = _Initial;

  const factory BottomNavState.changeBottomNavIndex(int index) = ChangeBottomNavIndex;
}
