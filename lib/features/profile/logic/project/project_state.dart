import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState<T> with _$ProjectState<T> {
  const factory ProjectState.initial() = _Initial;

  const factory ProjectState.loading() = ProjectLoadingState;

  const factory ProjectState.success(T data) = ProjectSuccessState<T>;

  const factory ProjectState.failure({required String errorMessage}) =
      ProjectFailureState;
}
