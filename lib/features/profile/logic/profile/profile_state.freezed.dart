// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingProfileData,
    required TResult Function(GetEngineerResponseModel engineerData)
        successProfileData,
    required TResult Function(String error) errorProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingProfileData,
    TResult? Function(GetEngineerResponseModel engineerData)?
        successProfileData,
    TResult? Function(String error)? errorProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingProfileData,
    TResult Function(GetEngineerResponseModel engineerData)? successProfileData,
    TResult Function(String error)? errorProfileData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(LoadingProfileData<T> value) loadingProfileData,
    required TResult Function(SuccessProfileData<T> value) successProfileData,
    required TResult Function(ErrorProfileData<T> value) errorProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult? Function(SuccessProfileData<T> value)? successProfileData,
    TResult? Function(ErrorProfileData<T> value)? errorProfileData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult Function(SuccessProfileData<T> value)? successProfileData,
    TResult Function(ErrorProfileData<T> value)? errorProfileData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<T, $Res> {
  factory $ProfileStateCopyWith(
          ProfileState<T> value, $Res Function(ProfileState<T>) then) =
      _$ProfileStateCopyWithImpl<T, $Res, ProfileState<T>>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<T, $Res, $Val extends ProfileState<T>>
    implements $ProfileStateCopyWith<T, $Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileInitialImplCopyWith<T, $Res> {
  factory _$$ProfileInitialImplCopyWith(_$ProfileInitialImpl<T> value,
          $Res Function(_$ProfileInitialImpl<T>) then) =
      __$$ProfileInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ProfileInitialImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$ProfileInitialImpl<T>>
    implements _$$ProfileInitialImplCopyWith<T, $Res> {
  __$$ProfileInitialImplCopyWithImpl(_$ProfileInitialImpl<T> _value,
      $Res Function(_$ProfileInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileInitialImpl<T> implements ProfileInitial<T> {
  const _$ProfileInitialImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingProfileData,
    required TResult Function(GetEngineerResponseModel engineerData)
        successProfileData,
    required TResult Function(String error) errorProfileData,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingProfileData,
    TResult? Function(GetEngineerResponseModel engineerData)?
        successProfileData,
    TResult? Function(String error)? errorProfileData,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingProfileData,
    TResult Function(GetEngineerResponseModel engineerData)? successProfileData,
    TResult Function(String error)? errorProfileData,
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
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(LoadingProfileData<T> value) loadingProfileData,
    required TResult Function(SuccessProfileData<T> value) successProfileData,
    required TResult Function(ErrorProfileData<T> value) errorProfileData,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult? Function(SuccessProfileData<T> value)? successProfileData,
    TResult? Function(ErrorProfileData<T> value)? errorProfileData,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult Function(SuccessProfileData<T> value)? successProfileData,
    TResult Function(ErrorProfileData<T> value)? errorProfileData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileInitial<T> implements ProfileState<T> {
  const factory ProfileInitial() = _$ProfileInitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingProfileDataImplCopyWith<T, $Res> {
  factory _$$LoadingProfileDataImplCopyWith(_$LoadingProfileDataImpl<T> value,
          $Res Function(_$LoadingProfileDataImpl<T>) then) =
      __$$LoadingProfileDataImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingProfileDataImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$LoadingProfileDataImpl<T>>
    implements _$$LoadingProfileDataImplCopyWith<T, $Res> {
  __$$LoadingProfileDataImplCopyWithImpl(_$LoadingProfileDataImpl<T> _value,
      $Res Function(_$LoadingProfileDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingProfileDataImpl<T> implements LoadingProfileData<T> {
  const _$LoadingProfileDataImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.loadingProfileData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingProfileDataImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingProfileData,
    required TResult Function(GetEngineerResponseModel engineerData)
        successProfileData,
    required TResult Function(String error) errorProfileData,
  }) {
    return loadingProfileData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingProfileData,
    TResult? Function(GetEngineerResponseModel engineerData)?
        successProfileData,
    TResult? Function(String error)? errorProfileData,
  }) {
    return loadingProfileData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingProfileData,
    TResult Function(GetEngineerResponseModel engineerData)? successProfileData,
    TResult Function(String error)? errorProfileData,
    required TResult orElse(),
  }) {
    if (loadingProfileData != null) {
      return loadingProfileData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(LoadingProfileData<T> value) loadingProfileData,
    required TResult Function(SuccessProfileData<T> value) successProfileData,
    required TResult Function(ErrorProfileData<T> value) errorProfileData,
  }) {
    return loadingProfileData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult? Function(SuccessProfileData<T> value)? successProfileData,
    TResult? Function(ErrorProfileData<T> value)? errorProfileData,
  }) {
    return loadingProfileData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult Function(SuccessProfileData<T> value)? successProfileData,
    TResult Function(ErrorProfileData<T> value)? errorProfileData,
    required TResult orElse(),
  }) {
    if (loadingProfileData != null) {
      return loadingProfileData(this);
    }
    return orElse();
  }
}

abstract class LoadingProfileData<T> implements ProfileState<T> {
  const factory LoadingProfileData() = _$LoadingProfileDataImpl<T>;
}

/// @nodoc
abstract class _$$SuccessProfileDataImplCopyWith<T, $Res> {
  factory _$$SuccessProfileDataImplCopyWith(_$SuccessProfileDataImpl<T> value,
          $Res Function(_$SuccessProfileDataImpl<T>) then) =
      __$$SuccessProfileDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({GetEngineerResponseModel engineerData});
}

/// @nodoc
class __$$SuccessProfileDataImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$SuccessProfileDataImpl<T>>
    implements _$$SuccessProfileDataImplCopyWith<T, $Res> {
  __$$SuccessProfileDataImplCopyWithImpl(_$SuccessProfileDataImpl<T> _value,
      $Res Function(_$SuccessProfileDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? engineerData = null,
  }) {
    return _then(_$SuccessProfileDataImpl<T>(
      null == engineerData
          ? _value.engineerData
          : engineerData // ignore: cast_nullable_to_non_nullable
              as GetEngineerResponseModel,
    ));
  }
}

/// @nodoc

class _$SuccessProfileDataImpl<T> implements SuccessProfileData<T> {
  const _$SuccessProfileDataImpl(this.engineerData);

  @override
  final GetEngineerResponseModel engineerData;

  @override
  String toString() {
    return 'ProfileState<$T>.successProfileData(engineerData: $engineerData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessProfileDataImpl<T> &&
            (identical(other.engineerData, engineerData) ||
                other.engineerData == engineerData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, engineerData);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessProfileDataImplCopyWith<T, _$SuccessProfileDataImpl<T>>
      get copyWith => __$$SuccessProfileDataImplCopyWithImpl<T,
          _$SuccessProfileDataImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingProfileData,
    required TResult Function(GetEngineerResponseModel engineerData)
        successProfileData,
    required TResult Function(String error) errorProfileData,
  }) {
    return successProfileData(engineerData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingProfileData,
    TResult? Function(GetEngineerResponseModel engineerData)?
        successProfileData,
    TResult? Function(String error)? errorProfileData,
  }) {
    return successProfileData?.call(engineerData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingProfileData,
    TResult Function(GetEngineerResponseModel engineerData)? successProfileData,
    TResult Function(String error)? errorProfileData,
    required TResult orElse(),
  }) {
    if (successProfileData != null) {
      return successProfileData(engineerData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(LoadingProfileData<T> value) loadingProfileData,
    required TResult Function(SuccessProfileData<T> value) successProfileData,
    required TResult Function(ErrorProfileData<T> value) errorProfileData,
  }) {
    return successProfileData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult? Function(SuccessProfileData<T> value)? successProfileData,
    TResult? Function(ErrorProfileData<T> value)? errorProfileData,
  }) {
    return successProfileData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult Function(SuccessProfileData<T> value)? successProfileData,
    TResult Function(ErrorProfileData<T> value)? errorProfileData,
    required TResult orElse(),
  }) {
    if (successProfileData != null) {
      return successProfileData(this);
    }
    return orElse();
  }
}

abstract class SuccessProfileData<T> implements ProfileState<T> {
  const factory SuccessProfileData(
          final GetEngineerResponseModel engineerData) =
      _$SuccessProfileDataImpl<T>;

  GetEngineerResponseModel get engineerData;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessProfileDataImplCopyWith<T, _$SuccessProfileDataImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorProfileDataImplCopyWith<T, $Res> {
  factory _$$ErrorProfileDataImplCopyWith(_$ErrorProfileDataImpl<T> value,
          $Res Function(_$ErrorProfileDataImpl<T>) then) =
      __$$ErrorProfileDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorProfileDataImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$ErrorProfileDataImpl<T>>
    implements _$$ErrorProfileDataImplCopyWith<T, $Res> {
  __$$ErrorProfileDataImplCopyWithImpl(_$ErrorProfileDataImpl<T> _value,
      $Res Function(_$ErrorProfileDataImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorProfileDataImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorProfileDataImpl<T> implements ErrorProfileData<T> {
  const _$ErrorProfileDataImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileState<$T>.errorProfileData(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProfileDataImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProfileDataImplCopyWith<T, _$ErrorProfileDataImpl<T>> get copyWith =>
      __$$ErrorProfileDataImplCopyWithImpl<T, _$ErrorProfileDataImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingProfileData,
    required TResult Function(GetEngineerResponseModel engineerData)
        successProfileData,
    required TResult Function(String error) errorProfileData,
  }) {
    return errorProfileData(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingProfileData,
    TResult? Function(GetEngineerResponseModel engineerData)?
        successProfileData,
    TResult? Function(String error)? errorProfileData,
  }) {
    return errorProfileData?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingProfileData,
    TResult Function(GetEngineerResponseModel engineerData)? successProfileData,
    TResult Function(String error)? errorProfileData,
    required TResult orElse(),
  }) {
    if (errorProfileData != null) {
      return errorProfileData(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(LoadingProfileData<T> value) loadingProfileData,
    required TResult Function(SuccessProfileData<T> value) successProfileData,
    required TResult Function(ErrorProfileData<T> value) errorProfileData,
  }) {
    return errorProfileData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult? Function(SuccessProfileData<T> value)? successProfileData,
    TResult? Function(ErrorProfileData<T> value)? errorProfileData,
  }) {
    return errorProfileData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(LoadingProfileData<T> value)? loadingProfileData,
    TResult Function(SuccessProfileData<T> value)? successProfileData,
    TResult Function(ErrorProfileData<T> value)? errorProfileData,
    required TResult orElse(),
  }) {
    if (errorProfileData != null) {
      return errorProfileData(this);
    }
    return orElse();
  }
}

abstract class ErrorProfileData<T> implements ProfileState<T> {
  const factory ErrorProfileData({required final String error}) =
      _$ErrorProfileDataImpl<T>;

  String get error;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorProfileDataImplCopyWith<T, _$ErrorProfileDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
