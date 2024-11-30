// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingUserTypes,
    required TResult Function(UserTypeModel userTypes) loadedUserTypes,
    required TResult Function(String message) errorUserTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingUserTypes,
    TResult? Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult? Function(String message)? errorUserTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingUserTypes,
    TResult Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult Function(String message)? errorUserTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingUserTypes value) loadingUserTypes,
    required TResult Function(LoadedUserTypes value) loadedUserTypes,
    required TResult Function(ErrorUserTypes value) errorUserTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingUserTypes value)? loadingUserTypes,
    TResult? Function(LoadedUserTypes value)? loadedUserTypes,
    TResult? Function(ErrorUserTypes value)? errorUserTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingUserTypes value)? loadingUserTypes,
    TResult Function(LoadedUserTypes value)? loadedUserTypes,
    TResult Function(ErrorUserTypes value)? errorUserTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SignUpState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingUserTypes,
    required TResult Function(UserTypeModel userTypes) loadedUserTypes,
    required TResult Function(String message) errorUserTypes,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingUserTypes,
    TResult? Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult? Function(String message)? errorUserTypes,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingUserTypes,
    TResult Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult Function(String message)? errorUserTypes,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingUserTypes value) loadingUserTypes,
    required TResult Function(LoadedUserTypes value) loadedUserTypes,
    required TResult Function(ErrorUserTypes value) errorUserTypes,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingUserTypes value)? loadingUserTypes,
    TResult? Function(LoadedUserTypes value)? loadedUserTypes,
    TResult? Function(ErrorUserTypes value)? errorUserTypes,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingUserTypes value)? loadingUserTypes,
    TResult Function(LoadedUserTypes value)? loadedUserTypes,
    TResult Function(ErrorUserTypes value)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignUpState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingUserTypesImplCopyWith<$Res> {
  factory _$$LoadingUserTypesImplCopyWith(_$LoadingUserTypesImpl value,
          $Res Function(_$LoadingUserTypesImpl) then) =
      __$$LoadingUserTypesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingUserTypesImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$LoadingUserTypesImpl>
    implements _$$LoadingUserTypesImplCopyWith<$Res> {
  __$$LoadingUserTypesImplCopyWithImpl(_$LoadingUserTypesImpl _value,
      $Res Function(_$LoadingUserTypesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingUserTypesImpl implements LoadingUserTypes {
  const _$LoadingUserTypesImpl();

  @override
  String toString() {
    return 'SignUpState.loadingUserTypes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingUserTypesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingUserTypes,
    required TResult Function(UserTypeModel userTypes) loadedUserTypes,
    required TResult Function(String message) errorUserTypes,
  }) {
    return loadingUserTypes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingUserTypes,
    TResult? Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult? Function(String message)? errorUserTypes,
  }) {
    return loadingUserTypes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingUserTypes,
    TResult Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult Function(String message)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (loadingUserTypes != null) {
      return loadingUserTypes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingUserTypes value) loadingUserTypes,
    required TResult Function(LoadedUserTypes value) loadedUserTypes,
    required TResult Function(ErrorUserTypes value) errorUserTypes,
  }) {
    return loadingUserTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingUserTypes value)? loadingUserTypes,
    TResult? Function(LoadedUserTypes value)? loadedUserTypes,
    TResult? Function(ErrorUserTypes value)? errorUserTypes,
  }) {
    return loadingUserTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingUserTypes value)? loadingUserTypes,
    TResult Function(LoadedUserTypes value)? loadedUserTypes,
    TResult Function(ErrorUserTypes value)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (loadingUserTypes != null) {
      return loadingUserTypes(this);
    }
    return orElse();
  }
}

abstract class LoadingUserTypes implements SignUpState {
  const factory LoadingUserTypes() = _$LoadingUserTypesImpl;
}

/// @nodoc
abstract class _$$LoadedUserTypesImplCopyWith<$Res> {
  factory _$$LoadedUserTypesImplCopyWith(_$LoadedUserTypesImpl value,
          $Res Function(_$LoadedUserTypesImpl) then) =
      __$$LoadedUserTypesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserTypeModel userTypes});
}

/// @nodoc
class __$$LoadedUserTypesImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$LoadedUserTypesImpl>
    implements _$$LoadedUserTypesImplCopyWith<$Res> {
  __$$LoadedUserTypesImplCopyWithImpl(
      _$LoadedUserTypesImpl _value, $Res Function(_$LoadedUserTypesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTypes = null,
  }) {
    return _then(_$LoadedUserTypesImpl(
      null == userTypes
          ? _value.userTypes
          : userTypes // ignore: cast_nullable_to_non_nullable
              as UserTypeModel,
    ));
  }
}

/// @nodoc

class _$LoadedUserTypesImpl implements LoadedUserTypes {
  const _$LoadedUserTypesImpl(this.userTypes);

  @override
  final UserTypeModel userTypes;

  @override
  String toString() {
    return 'SignUpState.loadedUserTypes(userTypes: $userTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedUserTypesImpl &&
            (identical(other.userTypes, userTypes) ||
                other.userTypes == userTypes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userTypes);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedUserTypesImplCopyWith<_$LoadedUserTypesImpl> get copyWith =>
      __$$LoadedUserTypesImplCopyWithImpl<_$LoadedUserTypesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingUserTypes,
    required TResult Function(UserTypeModel userTypes) loadedUserTypes,
    required TResult Function(String message) errorUserTypes,
  }) {
    return loadedUserTypes(userTypes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingUserTypes,
    TResult? Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult? Function(String message)? errorUserTypes,
  }) {
    return loadedUserTypes?.call(userTypes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingUserTypes,
    TResult Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult Function(String message)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (loadedUserTypes != null) {
      return loadedUserTypes(userTypes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingUserTypes value) loadingUserTypes,
    required TResult Function(LoadedUserTypes value) loadedUserTypes,
    required TResult Function(ErrorUserTypes value) errorUserTypes,
  }) {
    return loadedUserTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingUserTypes value)? loadingUserTypes,
    TResult? Function(LoadedUserTypes value)? loadedUserTypes,
    TResult? Function(ErrorUserTypes value)? errorUserTypes,
  }) {
    return loadedUserTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingUserTypes value)? loadingUserTypes,
    TResult Function(LoadedUserTypes value)? loadedUserTypes,
    TResult Function(ErrorUserTypes value)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (loadedUserTypes != null) {
      return loadedUserTypes(this);
    }
    return orElse();
  }
}

abstract class LoadedUserTypes implements SignUpState {
  const factory LoadedUserTypes(final UserTypeModel userTypes) =
      _$LoadedUserTypesImpl;

  UserTypeModel get userTypes;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedUserTypesImplCopyWith<_$LoadedUserTypesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorUserTypesImplCopyWith<$Res> {
  factory _$$ErrorUserTypesImplCopyWith(_$ErrorUserTypesImpl value,
          $Res Function(_$ErrorUserTypesImpl) then) =
      __$$ErrorUserTypesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorUserTypesImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$ErrorUserTypesImpl>
    implements _$$ErrorUserTypesImplCopyWith<$Res> {
  __$$ErrorUserTypesImplCopyWithImpl(
      _$ErrorUserTypesImpl _value, $Res Function(_$ErrorUserTypesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorUserTypesImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorUserTypesImpl implements ErrorUserTypes {
  const _$ErrorUserTypesImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignUpState.errorUserTypes(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorUserTypesImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorUserTypesImplCopyWith<_$ErrorUserTypesImpl> get copyWith =>
      __$$ErrorUserTypesImplCopyWithImpl<_$ErrorUserTypesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingUserTypes,
    required TResult Function(UserTypeModel userTypes) loadedUserTypes,
    required TResult Function(String message) errorUserTypes,
  }) {
    return errorUserTypes(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingUserTypes,
    TResult? Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult? Function(String message)? errorUserTypes,
  }) {
    return errorUserTypes?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingUserTypes,
    TResult Function(UserTypeModel userTypes)? loadedUserTypes,
    TResult Function(String message)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (errorUserTypes != null) {
      return errorUserTypes(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadingUserTypes value) loadingUserTypes,
    required TResult Function(LoadedUserTypes value) loadedUserTypes,
    required TResult Function(ErrorUserTypes value) errorUserTypes,
  }) {
    return errorUserTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadingUserTypes value)? loadingUserTypes,
    TResult? Function(LoadedUserTypes value)? loadedUserTypes,
    TResult? Function(ErrorUserTypes value)? errorUserTypes,
  }) {
    return errorUserTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadingUserTypes value)? loadingUserTypes,
    TResult Function(LoadedUserTypes value)? loadedUserTypes,
    TResult Function(ErrorUserTypes value)? errorUserTypes,
    required TResult orElse(),
  }) {
    if (errorUserTypes != null) {
      return errorUserTypes(this);
    }
    return orElse();
  }
}

abstract class ErrorUserTypes implements SignUpState {
  const factory ErrorUserTypes(final String message) = _$ErrorUserTypesImpl;

  String get message;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorUserTypesImplCopyWith<_$ErrorUserTypesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
