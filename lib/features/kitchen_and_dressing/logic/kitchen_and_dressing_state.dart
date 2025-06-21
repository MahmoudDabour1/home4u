import 'package:freezed_annotation/freezed_annotation.dart';
part 'kitchen_and_dressing_state.freezed.dart';
@freezed
class KitchenAndDressingState<T> with _$KitchenAndDressingState<T> {
  const factory KitchenAndDressingState.initial() = _Initial<T>;

  const factory KitchenAndDressingState.loading() = KitchenAndDressingLoading<T>;

  const factory KitchenAndDressingState.success(T data) = KitchenAndDressingSuccess<T>;

  const factory KitchenAndDressingState.failure(String error) = KitchenAndDressingFailure<T>;
}
