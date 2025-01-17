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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProjectLoadingState<T> value) loading,
    required TResult Function(ProjectSuccessState<T> value) success,
    required TResult Function(ProjectFailureState<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProjectLoadingState<T> value)? loading,
    TResult? Function(ProjectSuccessState<T> value)? success,
    TResult? Function(ProjectFailureState<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProjectLoadingState<T> value)? loading,
    TResult Function(ProjectSuccessState<T> value)? success,
    TResult Function(ProjectFailureState<T> value)? failure,
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
