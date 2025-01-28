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
    required TResult Function() getAllCertificationsLoading,
    required TResult Function(List<CertificationsData?>? certificationsData)
        getAllCertificationsSuccess,
    required TResult Function(String errorMessage) getAllCertificationsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllCertificationsLoading,
    TResult? Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult? Function(String errorMessage)? getAllCertificationsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllCertificationsLoading,
    TResult Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult Function(String errorMessage)? getAllCertificationsFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(CertificationsLoadingState<T> value)
        getAllCertificationsLoading,
    required TResult Function(CertificationsSuccessState<T> value)
        getAllCertificationsSuccess,
    required TResult Function(CertificationsFailureState<T> value)
        getAllCertificationsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult? Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult? Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
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
    required TResult Function() getAllCertificationsLoading,
    required TResult Function(List<CertificationsData?>? certificationsData)
        getAllCertificationsSuccess,
    required TResult Function(String errorMessage) getAllCertificationsFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllCertificationsLoading,
    TResult? Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult? Function(String errorMessage)? getAllCertificationsFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllCertificationsLoading,
    TResult Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult Function(String errorMessage)? getAllCertificationsFailure,
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
    required TResult Function(CertificationsLoadingState<T> value)
        getAllCertificationsLoading,
    required TResult Function(CertificationsSuccessState<T> value)
        getAllCertificationsSuccess,
    required TResult Function(CertificationsFailureState<T> value)
        getAllCertificationsFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult? Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult? Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
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
abstract class _$$CertificationsLoadingStateImplCopyWith<T, $Res> {
  factory _$$CertificationsLoadingStateImplCopyWith(
          _$CertificationsLoadingStateImpl<T> value,
          $Res Function(_$CertificationsLoadingStateImpl<T>) then) =
      __$$CertificationsLoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$CertificationsLoadingStateImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res,
        _$CertificationsLoadingStateImpl<T>>
    implements _$$CertificationsLoadingStateImplCopyWith<T, $Res> {
  __$$CertificationsLoadingStateImplCopyWithImpl(
      _$CertificationsLoadingStateImpl<T> _value,
      $Res Function(_$CertificationsLoadingStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CertificationsLoadingStateImpl<T>
    implements CertificationsLoadingState<T> {
  const _$CertificationsLoadingStateImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.getAllCertificationsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificationsLoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllCertificationsLoading,
    required TResult Function(List<CertificationsData?>? certificationsData)
        getAllCertificationsSuccess,
    required TResult Function(String errorMessage) getAllCertificationsFailure,
  }) {
    return getAllCertificationsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllCertificationsLoading,
    TResult? Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult? Function(String errorMessage)? getAllCertificationsFailure,
  }) {
    return getAllCertificationsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllCertificationsLoading,
    TResult Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult Function(String errorMessage)? getAllCertificationsFailure,
    required TResult orElse(),
  }) {
    if (getAllCertificationsLoading != null) {
      return getAllCertificationsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(CertificationsLoadingState<T> value)
        getAllCertificationsLoading,
    required TResult Function(CertificationsSuccessState<T> value)
        getAllCertificationsSuccess,
    required TResult Function(CertificationsFailureState<T> value)
        getAllCertificationsFailure,
  }) {
    return getAllCertificationsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult? Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult? Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
  }) {
    return getAllCertificationsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
    required TResult orElse(),
  }) {
    if (getAllCertificationsLoading != null) {
      return getAllCertificationsLoading(this);
    }
    return orElse();
  }
}

abstract class CertificationsLoadingState<T> implements ProfileState<T> {
  const factory CertificationsLoadingState() =
      _$CertificationsLoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$CertificationsSuccessStateImplCopyWith<T, $Res> {
  factory _$$CertificationsSuccessStateImplCopyWith(
          _$CertificationsSuccessStateImpl<T> value,
          $Res Function(_$CertificationsSuccessStateImpl<T>) then) =
      __$$CertificationsSuccessStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<CertificationsData?>? certificationsData});
}

/// @nodoc
class __$$CertificationsSuccessStateImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res,
        _$CertificationsSuccessStateImpl<T>>
    implements _$$CertificationsSuccessStateImplCopyWith<T, $Res> {
  __$$CertificationsSuccessStateImplCopyWithImpl(
      _$CertificationsSuccessStateImpl<T> _value,
      $Res Function(_$CertificationsSuccessStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificationsData = freezed,
  }) {
    return _then(_$CertificationsSuccessStateImpl<T>(
      freezed == certificationsData
          ? _value._certificationsData
          : certificationsData // ignore: cast_nullable_to_non_nullable
              as List<CertificationsData?>?,
    ));
  }
}

/// @nodoc

class _$CertificationsSuccessStateImpl<T>
    implements CertificationsSuccessState<T> {
  const _$CertificationsSuccessStateImpl(
      final List<CertificationsData?>? certificationsData)
      : _certificationsData = certificationsData;

  final List<CertificationsData?>? _certificationsData;
  @override
  List<CertificationsData?>? get certificationsData {
    final value = _certificationsData;
    if (value == null) return null;
    if (_certificationsData is EqualUnmodifiableListView)
      return _certificationsData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProfileState<$T>.getAllCertificationsSuccess(certificationsData: $certificationsData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificationsSuccessStateImpl<T> &&
            const DeepCollectionEquality()
                .equals(other._certificationsData, _certificationsData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_certificationsData));

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificationsSuccessStateImplCopyWith<T,
          _$CertificationsSuccessStateImpl<T>>
      get copyWith => __$$CertificationsSuccessStateImplCopyWithImpl<T,
          _$CertificationsSuccessStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllCertificationsLoading,
    required TResult Function(List<CertificationsData?>? certificationsData)
        getAllCertificationsSuccess,
    required TResult Function(String errorMessage) getAllCertificationsFailure,
  }) {
    return getAllCertificationsSuccess(certificationsData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllCertificationsLoading,
    TResult? Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult? Function(String errorMessage)? getAllCertificationsFailure,
  }) {
    return getAllCertificationsSuccess?.call(certificationsData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllCertificationsLoading,
    TResult Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult Function(String errorMessage)? getAllCertificationsFailure,
    required TResult orElse(),
  }) {
    if (getAllCertificationsSuccess != null) {
      return getAllCertificationsSuccess(certificationsData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(CertificationsLoadingState<T> value)
        getAllCertificationsLoading,
    required TResult Function(CertificationsSuccessState<T> value)
        getAllCertificationsSuccess,
    required TResult Function(CertificationsFailureState<T> value)
        getAllCertificationsFailure,
  }) {
    return getAllCertificationsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult? Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult? Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
  }) {
    return getAllCertificationsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
    required TResult orElse(),
  }) {
    if (getAllCertificationsSuccess != null) {
      return getAllCertificationsSuccess(this);
    }
    return orElse();
  }
}

abstract class CertificationsSuccessState<T> implements ProfileState<T> {
  const factory CertificationsSuccessState(
          final List<CertificationsData?>? certificationsData) =
      _$CertificationsSuccessStateImpl<T>;

  List<CertificationsData?>? get certificationsData;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificationsSuccessStateImplCopyWith<T,
          _$CertificationsSuccessStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CertificationsFailureStateImplCopyWith<T, $Res> {
  factory _$$CertificationsFailureStateImplCopyWith(
          _$CertificationsFailureStateImpl<T> value,
          $Res Function(_$CertificationsFailureStateImpl<T>) then) =
      __$$CertificationsFailureStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$CertificationsFailureStateImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res,
        _$CertificationsFailureStateImpl<T>>
    implements _$$CertificationsFailureStateImplCopyWith<T, $Res> {
  __$$CertificationsFailureStateImplCopyWithImpl(
      _$CertificationsFailureStateImpl<T> _value,
      $Res Function(_$CertificationsFailureStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$CertificationsFailureStateImpl<T>(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CertificationsFailureStateImpl<T>
    implements CertificationsFailureState<T> {
  const _$CertificationsFailureStateImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProfileState<$T>.getAllCertificationsFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificationsFailureStateImpl<T> &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificationsFailureStateImplCopyWith<T,
          _$CertificationsFailureStateImpl<T>>
      get copyWith => __$$CertificationsFailureStateImplCopyWithImpl<T,
          _$CertificationsFailureStateImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getAllCertificationsLoading,
    required TResult Function(List<CertificationsData?>? certificationsData)
        getAllCertificationsSuccess,
    required TResult Function(String errorMessage) getAllCertificationsFailure,
  }) {
    return getAllCertificationsFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getAllCertificationsLoading,
    TResult? Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult? Function(String errorMessage)? getAllCertificationsFailure,
  }) {
    return getAllCertificationsFailure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getAllCertificationsLoading,
    TResult Function(List<CertificationsData?>? certificationsData)?
        getAllCertificationsSuccess,
    TResult Function(String errorMessage)? getAllCertificationsFailure,
    required TResult orElse(),
  }) {
    if (getAllCertificationsFailure != null) {
      return getAllCertificationsFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial<T> value) initial,
    required TResult Function(CertificationsLoadingState<T> value)
        getAllCertificationsLoading,
    required TResult Function(CertificationsSuccessState<T> value)
        getAllCertificationsSuccess,
    required TResult Function(CertificationsFailureState<T> value)
        getAllCertificationsFailure,
  }) {
    return getAllCertificationsFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial<T> value)? initial,
    TResult? Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult? Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult? Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
  }) {
    return getAllCertificationsFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial<T> value)? initial,
    TResult Function(CertificationsLoadingState<T> value)?
        getAllCertificationsLoading,
    TResult Function(CertificationsSuccessState<T> value)?
        getAllCertificationsSuccess,
    TResult Function(CertificationsFailureState<T> value)?
        getAllCertificationsFailure,
    required TResult orElse(),
  }) {
    if (getAllCertificationsFailure != null) {
      return getAllCertificationsFailure(this);
    }
    return orElse();
  }
}

abstract class CertificationsFailureState<T> implements ProfileState<T> {
  const factory CertificationsFailureState(
          {required final String errorMessage}) =
      _$CertificationsFailureStateImpl<T>;

  String get errorMessage;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificationsFailureStateImplCopyWith<T,
          _$CertificationsFailureStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
