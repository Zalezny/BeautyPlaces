// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSessionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function(User user) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLogged,
    TResult? Function(User user)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function(User user)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLogged value) notLogged,
    required TResult Function(_Logged value) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotLogged value)? notLogged,
    TResult? Function(_Logged value)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLogged value)? notLogged,
    TResult Function(_Logged value)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSessionStateCopyWith<$Res> {
  factory $UserSessionStateCopyWith(
          UserSessionState value, $Res Function(UserSessionState) then) =
      _$UserSessionStateCopyWithImpl<$Res, UserSessionState>;
}

/// @nodoc
class _$UserSessionStateCopyWithImpl<$Res, $Val extends UserSessionState>
    implements $UserSessionStateCopyWith<$Res> {
  _$UserSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotLoggedImplCopyWith<$Res> {
  factory _$$NotLoggedImplCopyWith(
          _$NotLoggedImpl value, $Res Function(_$NotLoggedImpl) then) =
      __$$NotLoggedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotLoggedImplCopyWithImpl<$Res>
    extends _$UserSessionStateCopyWithImpl<$Res, _$NotLoggedImpl>
    implements _$$NotLoggedImplCopyWith<$Res> {
  __$$NotLoggedImplCopyWithImpl(
      _$NotLoggedImpl _value, $Res Function(_$NotLoggedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotLoggedImpl implements _NotLogged {
  const _$NotLoggedImpl();

  @override
  String toString() {
    return 'UserSessionState.notLogged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotLoggedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function(User user) logged,
  }) {
    return notLogged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLogged,
    TResult? Function(User user)? logged,
  }) {
    return notLogged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function(User user)? logged,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLogged value) notLogged,
    required TResult Function(_Logged value) logged,
  }) {
    return notLogged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotLogged value)? notLogged,
    TResult? Function(_Logged value)? logged,
  }) {
    return notLogged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLogged value)? notLogged,
    TResult Function(_Logged value)? logged,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged(this);
    }
    return orElse();
  }
}

abstract class _NotLogged implements UserSessionState {
  const factory _NotLogged() = _$NotLoggedImpl;
}

/// @nodoc
abstract class _$$LoggedImplCopyWith<$Res> {
  factory _$$LoggedImplCopyWith(
          _$LoggedImpl value, $Res Function(_$LoggedImpl) then) =
      __$$LoggedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$LoggedImplCopyWithImpl<$Res>
    extends _$UserSessionStateCopyWithImpl<$Res, _$LoggedImpl>
    implements _$$LoggedImplCopyWith<$Res> {
  __$$LoggedImplCopyWithImpl(
      _$LoggedImpl _value, $Res Function(_$LoggedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoggedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$LoggedImpl implements _Logged {
  const _$LoggedImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'UserSessionState.logged(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedImplCopyWith<_$LoggedImpl> get copyWith =>
      __$$LoggedImplCopyWithImpl<_$LoggedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLogged,
    required TResult Function(User user) logged,
  }) {
    return logged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLogged,
    TResult? Function(User user)? logged,
  }) {
    return logged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLogged,
    TResult Function(User user)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotLogged value) notLogged,
    required TResult Function(_Logged value) logged,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotLogged value)? notLogged,
    TResult? Function(_Logged value)? logged,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotLogged value)? notLogged,
    TResult Function(_Logged value)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class _Logged implements UserSessionState {
  const factory _Logged({required final User user}) = _$LoggedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$LoggedImplCopyWith<_$LoggedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
