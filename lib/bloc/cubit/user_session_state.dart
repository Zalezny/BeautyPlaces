part of 'user_session_cubit.dart';

@freezed
class UserSessionState with _$UserSessionState {
  const factory UserSessionState.notLogged() = _NotLogged;
  const factory UserSessionState.logged({required User user}) = _Logged;
}
