// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() businessConfigLoading,
    required TResult Function(T data) businessConfigSuccess,
    required TResult Function(String errorMessage) businessConfigFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? businessConfigLoading,
    TResult? Function(T data)? businessConfigSuccess,
    TResult? Function(String errorMessage)? businessConfigFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? businessConfigLoading,
    TResult Function(T data)? businessConfigSuccess,
    TResult Function(String errorMessage)? businessConfigFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BusinessConfigLoading<T> value)
        businessConfigLoading,
    required TResult Function(BusinessConfigSuccess<T> value)
        businessConfigSuccess,
    required TResult Function(BusinessConfigFailure<T> value)
        businessConfigFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult? Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult? Function(BusinessConfigFailure<T> value)? businessConfigFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult Function(BusinessConfigFailure<T> value)? businessConfigFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<T, $Res> {
  factory $ProductsStateCopyWith(
          ProductsState<T> value, $Res Function(ProductsState<T>) then) =
      _$ProductsStateCopyWithImpl<T, $Res, ProductsState<T>>;
}

/// @nodoc
class _$ProductsStateCopyWithImpl<T, $Res, $Val extends ProductsState<T>>
    implements $ProductsStateCopyWith<T, $Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsState
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
    extends _$ProductsStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductsState<$T>.initial()';
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
    required TResult Function() businessConfigLoading,
    required TResult Function(T data) businessConfigSuccess,
    required TResult Function(String errorMessage) businessConfigFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? businessConfigLoading,
    TResult? Function(T data)? businessConfigSuccess,
    TResult? Function(String errorMessage)? businessConfigFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? businessConfigLoading,
    TResult Function(T data)? businessConfigSuccess,
    TResult Function(String errorMessage)? businessConfigFailure,
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
    required TResult Function(BusinessConfigLoading<T> value)
        businessConfigLoading,
    required TResult Function(BusinessConfigSuccess<T> value)
        businessConfigSuccess,
    required TResult Function(BusinessConfigFailure<T> value)
        businessConfigFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult? Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult? Function(BusinessConfigFailure<T> value)? businessConfigFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult Function(BusinessConfigFailure<T> value)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProductsState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$BusinessConfigLoadingImplCopyWith<T, $Res> {
  factory _$$BusinessConfigLoadingImplCopyWith(
          _$BusinessConfigLoadingImpl<T> value,
          $Res Function(_$BusinessConfigLoadingImpl<T>) then) =
      __$$BusinessConfigLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$BusinessConfigLoadingImplCopyWithImpl<T, $Res>
    extends _$ProductsStateCopyWithImpl<T, $Res, _$BusinessConfigLoadingImpl<T>>
    implements _$$BusinessConfigLoadingImplCopyWith<T, $Res> {
  __$$BusinessConfigLoadingImplCopyWithImpl(
      _$BusinessConfigLoadingImpl<T> _value,
      $Res Function(_$BusinessConfigLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BusinessConfigLoadingImpl<T> implements BusinessConfigLoading<T> {
  const _$BusinessConfigLoadingImpl();

  @override
  String toString() {
    return 'ProductsState<$T>.businessConfigLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessConfigLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() businessConfigLoading,
    required TResult Function(T data) businessConfigSuccess,
    required TResult Function(String errorMessage) businessConfigFailure,
  }) {
    return businessConfigLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? businessConfigLoading,
    TResult? Function(T data)? businessConfigSuccess,
    TResult? Function(String errorMessage)? businessConfigFailure,
  }) {
    return businessConfigLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? businessConfigLoading,
    TResult Function(T data)? businessConfigSuccess,
    TResult Function(String errorMessage)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (businessConfigLoading != null) {
      return businessConfigLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BusinessConfigLoading<T> value)
        businessConfigLoading,
    required TResult Function(BusinessConfigSuccess<T> value)
        businessConfigSuccess,
    required TResult Function(BusinessConfigFailure<T> value)
        businessConfigFailure,
  }) {
    return businessConfigLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult? Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult? Function(BusinessConfigFailure<T> value)? businessConfigFailure,
  }) {
    return businessConfigLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult Function(BusinessConfigFailure<T> value)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (businessConfigLoading != null) {
      return businessConfigLoading(this);
    }
    return orElse();
  }
}

abstract class BusinessConfigLoading<T> implements ProductsState<T> {
  const factory BusinessConfigLoading() = _$BusinessConfigLoadingImpl<T>;
}

/// @nodoc
abstract class _$$BusinessConfigSuccessImplCopyWith<T, $Res> {
  factory _$$BusinessConfigSuccessImplCopyWith(
          _$BusinessConfigSuccessImpl<T> value,
          $Res Function(_$BusinessConfigSuccessImpl<T>) then) =
      __$$BusinessConfigSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$BusinessConfigSuccessImplCopyWithImpl<T, $Res>
    extends _$ProductsStateCopyWithImpl<T, $Res, _$BusinessConfigSuccessImpl<T>>
    implements _$$BusinessConfigSuccessImplCopyWith<T, $Res> {
  __$$BusinessConfigSuccessImplCopyWithImpl(
      _$BusinessConfigSuccessImpl<T> _value,
      $Res Function(_$BusinessConfigSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BusinessConfigSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$BusinessConfigSuccessImpl<T> implements BusinessConfigSuccess<T> {
  const _$BusinessConfigSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ProductsState<$T>.businessConfigSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessConfigSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessConfigSuccessImplCopyWith<T, _$BusinessConfigSuccessImpl<T>>
      get copyWith => __$$BusinessConfigSuccessImplCopyWithImpl<T,
          _$BusinessConfigSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() businessConfigLoading,
    required TResult Function(T data) businessConfigSuccess,
    required TResult Function(String errorMessage) businessConfigFailure,
  }) {
    return businessConfigSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? businessConfigLoading,
    TResult? Function(T data)? businessConfigSuccess,
    TResult? Function(String errorMessage)? businessConfigFailure,
  }) {
    return businessConfigSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? businessConfigLoading,
    TResult Function(T data)? businessConfigSuccess,
    TResult Function(String errorMessage)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (businessConfigSuccess != null) {
      return businessConfigSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BusinessConfigLoading<T> value)
        businessConfigLoading,
    required TResult Function(BusinessConfigSuccess<T> value)
        businessConfigSuccess,
    required TResult Function(BusinessConfigFailure<T> value)
        businessConfigFailure,
  }) {
    return businessConfigSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult? Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult? Function(BusinessConfigFailure<T> value)? businessConfigFailure,
  }) {
    return businessConfigSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult Function(BusinessConfigFailure<T> value)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (businessConfigSuccess != null) {
      return businessConfigSuccess(this);
    }
    return orElse();
  }
}

abstract class BusinessConfigSuccess<T> implements ProductsState<T> {
  const factory BusinessConfigSuccess(final T data) =
      _$BusinessConfigSuccessImpl<T>;

  T get data;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessConfigSuccessImplCopyWith<T, _$BusinessConfigSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BusinessConfigFailureImplCopyWith<T, $Res> {
  factory _$$BusinessConfigFailureImplCopyWith(
          _$BusinessConfigFailureImpl<T> value,
          $Res Function(_$BusinessConfigFailureImpl<T>) then) =
      __$$BusinessConfigFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$BusinessConfigFailureImplCopyWithImpl<T, $Res>
    extends _$ProductsStateCopyWithImpl<T, $Res, _$BusinessConfigFailureImpl<T>>
    implements _$$BusinessConfigFailureImplCopyWith<T, $Res> {
  __$$BusinessConfigFailureImplCopyWithImpl(
      _$BusinessConfigFailureImpl<T> _value,
      $Res Function(_$BusinessConfigFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$BusinessConfigFailureImpl<T>(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BusinessConfigFailureImpl<T> implements BusinessConfigFailure<T> {
  const _$BusinessConfigFailureImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProductsState<$T>.businessConfigFailure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessConfigFailureImpl<T> &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessConfigFailureImplCopyWith<T, _$BusinessConfigFailureImpl<T>>
      get copyWith => __$$BusinessConfigFailureImplCopyWithImpl<T,
          _$BusinessConfigFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() businessConfigLoading,
    required TResult Function(T data) businessConfigSuccess,
    required TResult Function(String errorMessage) businessConfigFailure,
  }) {
    return businessConfigFailure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? businessConfigLoading,
    TResult? Function(T data)? businessConfigSuccess,
    TResult? Function(String errorMessage)? businessConfigFailure,
  }) {
    return businessConfigFailure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? businessConfigLoading,
    TResult Function(T data)? businessConfigSuccess,
    TResult Function(String errorMessage)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (businessConfigFailure != null) {
      return businessConfigFailure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(BusinessConfigLoading<T> value)
        businessConfigLoading,
    required TResult Function(BusinessConfigSuccess<T> value)
        businessConfigSuccess,
    required TResult Function(BusinessConfigFailure<T> value)
        businessConfigFailure,
  }) {
    return businessConfigFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult? Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult? Function(BusinessConfigFailure<T> value)? businessConfigFailure,
  }) {
    return businessConfigFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(BusinessConfigLoading<T> value)? businessConfigLoading,
    TResult Function(BusinessConfigSuccess<T> value)? businessConfigSuccess,
    TResult Function(BusinessConfigFailure<T> value)? businessConfigFailure,
    required TResult orElse(),
  }) {
    if (businessConfigFailure != null) {
      return businessConfigFailure(this);
    }
    return orElse();
  }
}

abstract class BusinessConfigFailure<T> implements ProductsState<T> {
  const factory BusinessConfigFailure({required final String errorMessage}) =
      _$BusinessConfigFailureImpl<T>;

  String get errorMessage;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessConfigFailureImplCopyWith<T, _$BusinessConfigFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
