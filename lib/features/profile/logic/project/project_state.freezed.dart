// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<T, $Res> {
  factory $ProjectStateCopyWith(
          ProjectState<T> value, $Res Function(ProjectState<T>) then) =
      _$ProjectStateCopyWithImpl<T, $Res, ProjectState<T>>;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<T, $Res, $Val extends ProjectState<T>>
    implements $ProjectStateCopyWith<T, $Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProjectState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProjectState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ProjectLoadingStateImplCopyWith<T, $Res> {
  factory _$$ProjectLoadingStateImplCopyWith(_$ProjectLoadingStateImpl<T> value,
          $Res Function(_$ProjectLoadingStateImpl<T>) then) =
      __$$ProjectLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ProjectLoadingStateImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$ProjectLoadingStateImpl<T>>
    implements _$$ProjectLoadingStateImplCopyWith<T, $Res> {
  __$$ProjectLoadingStateImplCopyWithImpl(_$ProjectLoadingStateImpl<T> _value,
      $Res Function(_$ProjectLoadingStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectLoadingStateImpl<T> implements ProjectLoadingState<T> {
  const _$ProjectLoadingStateImpl();

  @override
  String toString() {
    return 'ProjectState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProjectLoadingState<T> implements ProjectState<T> {
  const factory ProjectLoadingState() = _$ProjectLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$ProjectSuccessStateImplCopyWith<T, $Res> {
  factory _$$ProjectSuccessStateImplCopyWith(_$ProjectSuccessStateImpl<T> value,
          $Res Function(_$ProjectSuccessStateImpl<T>) then) =
      __$$ProjectSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ProjectSuccessStateImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$ProjectSuccessStateImpl<T>>
    implements _$$ProjectSuccessStateImplCopyWith<T, $Res> {
  __$$ProjectSuccessStateImplCopyWithImpl(_$ProjectSuccessStateImpl<T> _value,
      $Res Function(_$ProjectSuccessStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ProjectSuccessStateImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ProjectSuccessStateImpl<T> implements ProjectSuccessState<T> {
  const _$ProjectSuccessStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ProjectState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSuccessStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSuccessStateImplCopyWith<T, _$ProjectSuccessStateImpl<T>>
      get copyWith => __$$ProjectSuccessStateImplCopyWithImpl<T,
          _$ProjectSuccessStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProjectSuccessState<T> implements ProjectState<T> {
  const factory ProjectSuccessState(final T data) =
      _$ProjectSuccessStateImpl<T>;

  T get data;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectSuccessStateImplCopyWith<T, _$ProjectSuccessStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectFailureStateImplCopyWith<T, $Res> {
  factory _$$ProjectFailureStateImplCopyWith(_$ProjectFailureStateImpl<T> value,
          $Res Function(_$ProjectFailureStateImpl<T>) then) =
      __$$ProjectFailureStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ProjectFailureStateImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$ProjectFailureStateImpl<T>>
    implements _$$ProjectFailureStateImplCopyWith<T, $Res> {
  __$$ProjectFailureStateImplCopyWithImpl(_$ProjectFailureStateImpl<T> _value,
      $Res Function(_$ProjectFailureStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ProjectFailureStateImpl<T>(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectFailureStateImpl<T> implements ProjectFailureState<T> {
  const _$ProjectFailureStateImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProjectState<$T>.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFailureStateImpl<T> &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFailureStateImplCopyWith<T, _$ProjectFailureStateImpl<T>>
      get copyWith => __$$ProjectFailureStateImplCopyWithImpl<T,
          _$ProjectFailureStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ProjectFailureState<T> implements ProjectState<T> {
  const factory ProjectFailureState({required final String errorMessage}) =
      _$ProjectFailureStateImpl<T>;

  String get errorMessage;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectFailureStateImplCopyWith<T, _$ProjectFailureStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProjectsLoadingImplCopyWith<T, $Res> {
  factory _$$GetProjectsLoadingImplCopyWith(_$GetProjectsLoadingImpl<T> value,
          $Res Function(_$GetProjectsLoadingImpl<T>) then) =
      __$$GetProjectsLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GetProjectsLoadingImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$GetProjectsLoadingImpl<T>>
    implements _$$GetProjectsLoadingImplCopyWith<T, $Res> {
  __$$GetProjectsLoadingImplCopyWithImpl(_$GetProjectsLoadingImpl<T> _value,
      $Res Function(_$GetProjectsLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetProjectsLoadingImpl<T> implements GetProjectsLoading<T> {
  const _$GetProjectsLoadingImpl();

  @override
  String toString() {
    return 'ProjectState<$T>.getProjectsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return getProjectsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return getProjectsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (getProjectsLoading != null) {
      return getProjectsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return getProjectsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return getProjectsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (getProjectsLoading != null) {
      return getProjectsLoading(this);
    }
    return orElse();
  }
}

abstract class GetProjectsLoading<T> implements ProjectState<T> {
  const factory GetProjectsLoading() = _$GetProjectsLoadingImpl<T>;
}

/// @nodoc
abstract class _$$GetProjectsSuccessImplCopyWith<T, $Res> {
  factory _$$GetProjectsSuccessImplCopyWith(_$GetProjectsSuccessImpl<T> value,
          $Res Function(_$GetProjectsSuccessImpl<T>) then) =
      __$$GetProjectsSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<ProjectsData?>? projectData});
}

/// @nodoc
class __$$GetProjectsSuccessImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$GetProjectsSuccessImpl<T>>
    implements _$$GetProjectsSuccessImplCopyWith<T, $Res> {
  __$$GetProjectsSuccessImplCopyWithImpl(_$GetProjectsSuccessImpl<T> _value,
      $Res Function(_$GetProjectsSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectData = freezed,
  }) {
    return _then(_$GetProjectsSuccessImpl<T>(
      freezed == projectData
          ? _value._projectData
          : projectData // ignore: cast_nullable_to_non_nullable
              as List<ProjectsData?>?,
    ));
  }
}

/// @nodoc

class _$GetProjectsSuccessImpl<T> implements GetProjectsSuccess<T> {
  const _$GetProjectsSuccessImpl(final List<ProjectsData?>? projectData)
      : _projectData = projectData;

  final List<ProjectsData?>? _projectData;
  @override
  List<ProjectsData?>? get projectData {
    final value = _projectData;
    if (value == null) return null;
    if (_projectData is EqualUnmodifiableListView) return _projectData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProjectState<$T>.getProjectsSuccess(projectData: $projectData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsSuccessImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._projectData, _projectData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectData));

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsSuccessImplCopyWith<T, _$GetProjectsSuccessImpl<T>>
      get copyWith => __$$GetProjectsSuccessImplCopyWithImpl<T,
          _$GetProjectsSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return getProjectsSuccess(projectData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return getProjectsSuccess?.call(projectData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (getProjectsSuccess != null) {
      return getProjectsSuccess(projectData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return getProjectsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return getProjectsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (getProjectsSuccess != null) {
      return getProjectsSuccess(this);
    }
    return orElse();
  }
}

abstract class GetProjectsSuccess<T> implements ProjectState<T> {
  const factory GetProjectsSuccess(final List<ProjectsData?>? projectData) =
      _$GetProjectsSuccessImpl<T>;

  List<ProjectsData?>? get projectData;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProjectsSuccessImplCopyWith<T, _$GetProjectsSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProjectsErrorImplCopyWith<T, $Res> {
  factory _$$GetProjectsErrorImplCopyWith(_$GetProjectsErrorImpl<T> value,
          $Res Function(_$GetProjectsErrorImpl<T>) then) =
      __$$GetProjectsErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetProjectsErrorImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$GetProjectsErrorImpl<T>>
    implements _$$GetProjectsErrorImplCopyWith<T, $Res> {
  __$$GetProjectsErrorImplCopyWithImpl(_$GetProjectsErrorImpl<T> _value,
      $Res Function(_$GetProjectsErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetProjectsErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProjectsErrorImpl<T> implements GetProjectsError<T> {
  const _$GetProjectsErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProjectState<$T>.getProjectsError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsErrorImplCopyWith<T, _$GetProjectsErrorImpl<T>> get copyWith =>
      __$$GetProjectsErrorImplCopyWithImpl<T, _$GetProjectsErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return getProjectsError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return getProjectsError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (getProjectsError != null) {
      return getProjectsError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return getProjectsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return getProjectsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (getProjectsError != null) {
      return getProjectsError(this);
    }
    return orElse();
  }
}

abstract class GetProjectsError<T> implements ProjectState<T> {
  const factory GetProjectsError({required final String error}) =
      _$GetProjectsErrorImpl<T>;

  String get error;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProjectsErrorImplCopyWith<T, _$GetProjectsErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProjectLoadingImplCopyWith<T, $Res> {
  factory _$$DeleteProjectLoadingImplCopyWith(
          _$DeleteProjectLoadingImpl<T> value,
          $Res Function(_$DeleteProjectLoadingImpl<T>) then) =
      __$$DeleteProjectLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DeleteProjectLoadingImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$DeleteProjectLoadingImpl<T>>
    implements _$$DeleteProjectLoadingImplCopyWith<T, $Res> {
  __$$DeleteProjectLoadingImplCopyWithImpl(_$DeleteProjectLoadingImpl<T> _value,
      $Res Function(_$DeleteProjectLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteProjectLoadingImpl<T> implements DeleteProjectLoading<T> {
  const _$DeleteProjectLoadingImpl();

  @override
  String toString() {
    return 'ProjectState<$T>.deleteProjectLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProjectLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return deleteProjectLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return deleteProjectLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (deleteProjectLoading != null) {
      return deleteProjectLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return deleteProjectLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return deleteProjectLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (deleteProjectLoading != null) {
      return deleteProjectLoading(this);
    }
    return orElse();
  }
}

abstract class DeleteProjectLoading<T> implements ProjectState<T> {
  const factory DeleteProjectLoading() = _$DeleteProjectLoadingImpl<T>;
}

/// @nodoc
abstract class _$$DeleteProjectSuccessImplCopyWith<T, $Res> {
  factory _$$DeleteProjectSuccessImplCopyWith(
          _$DeleteProjectSuccessImpl<T> value,
          $Res Function(_$DeleteProjectSuccessImpl<T>) then) =
      __$$DeleteProjectSuccessImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DeleteProjectSuccessImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$DeleteProjectSuccessImpl<T>>
    implements _$$DeleteProjectSuccessImplCopyWith<T, $Res> {
  __$$DeleteProjectSuccessImplCopyWithImpl(_$DeleteProjectSuccessImpl<T> _value,
      $Res Function(_$DeleteProjectSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteProjectSuccessImpl<T> implements DeleteProjectSuccess<T> {
  const _$DeleteProjectSuccessImpl();

  @override
  String toString() {
    return 'ProjectState<$T>.deleteProjectSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProjectSuccessImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return deleteProjectSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return deleteProjectSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (deleteProjectSuccess != null) {
      return deleteProjectSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return deleteProjectSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return deleteProjectSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (deleteProjectSuccess != null) {
      return deleteProjectSuccess(this);
    }
    return orElse();
  }
}

abstract class DeleteProjectSuccess<T> implements ProjectState<T> {
  const factory DeleteProjectSuccess() = _$DeleteProjectSuccessImpl<T>;
}

/// @nodoc
abstract class _$$DeleteProjectErrorImplCopyWith<T, $Res> {
  factory _$$DeleteProjectErrorImplCopyWith(_$DeleteProjectErrorImpl<T> value,
          $Res Function(_$DeleteProjectErrorImpl<T>) then) =
      __$$DeleteProjectErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DeleteProjectErrorImplCopyWithImpl<T, $Res>
    extends _$ProjectStateCopyWithImpl<T, $Res, _$DeleteProjectErrorImpl<T>>
    implements _$$DeleteProjectErrorImplCopyWith<T, $Res> {
  __$$DeleteProjectErrorImplCopyWithImpl(_$DeleteProjectErrorImpl<T> _value,
      $Res Function(_$DeleteProjectErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DeleteProjectErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteProjectErrorImpl<T> implements DeleteProjectError<T> {
  const _$DeleteProjectErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProjectState<$T>.deleteProjectError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProjectErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProjectErrorImplCopyWith<T, _$DeleteProjectErrorImpl<T>>
      get copyWith => __$$DeleteProjectErrorImplCopyWithImpl<T,
          _$DeleteProjectErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String errorMessage) failure,
    required TResult Function() getProjectsLoading,
    required TResult Function(List<ProjectsData?>? projectData)
        getProjectsSuccess,
    required TResult Function(String error) getProjectsError,
    required TResult Function() deleteProjectLoading,
    required TResult Function() deleteProjectSuccess,
    required TResult Function(String error) deleteProjectError,
  }) {
    return deleteProjectError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
    TResult? Function()? getProjectsLoading,
    TResult? Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult? Function(String error)? getProjectsError,
    TResult? Function()? deleteProjectLoading,
    TResult? Function()? deleteProjectSuccess,
    TResult? Function(String error)? deleteProjectError,
  }) {
    return deleteProjectError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    TResult Function()? getProjectsLoading,
    TResult Function(List<ProjectsData?>? projectData)? getProjectsSuccess,
    TResult Function(String error)? getProjectsError,
    TResult Function()? deleteProjectLoading,
    TResult Function()? deleteProjectSuccess,
    TResult Function(String error)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (deleteProjectError != null) {
      return deleteProjectError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
    required TResult Function(GetProjectsLoading<T> value) getProjectsLoading,
    required TResult Function(GetProjectsSuccess<T> value) getProjectsSuccess,
    required TResult Function(GetProjectsError<T> value) getProjectsError,
    required TResult Function(DeleteProjectLoading<T> value)
        deleteProjectLoading,
    required TResult Function(DeleteProjectSuccess<T> value)
        deleteProjectSuccess,
    required TResult Function(DeleteProjectError<T> value) deleteProjectError,
  }) {
    return deleteProjectError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
    TResult? Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult? Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult? Function(GetProjectsError<T> value)? getProjectsError,
    TResult? Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult? Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult? Function(DeleteProjectError<T> value)? deleteProjectError,
  }) {
    return deleteProjectError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
    TResult Function(GetProjectsLoading<T> value)? getProjectsLoading,
    TResult Function(GetProjectsSuccess<T> value)? getProjectsSuccess,
    TResult Function(GetProjectsError<T> value)? getProjectsError,
    TResult Function(DeleteProjectLoading<T> value)? deleteProjectLoading,
    TResult Function(DeleteProjectSuccess<T> value)? deleteProjectSuccess,
    TResult Function(DeleteProjectError<T> value)? deleteProjectError,
    required TResult orElse(),
  }) {
    if (deleteProjectError != null) {
      return deleteProjectError(this);
    }
    return orElse();
  }
}

abstract class DeleteProjectError<T> implements ProjectState<T> {
  const factory DeleteProjectError({required final String error}) =
      _$DeleteProjectErrorImpl<T>;

  String get error;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteProjectErrorImplCopyWith<T, _$DeleteProjectErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
