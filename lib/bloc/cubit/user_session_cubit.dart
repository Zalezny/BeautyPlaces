import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';

part 'user_session_cubit.freezed.dart';
part 'user_session_state.dart';

@lazySingleton
class UserSessionCubit extends Cubit<UserSessionState> {
  UserSessionCubit() : super(const UserSessionState.notLogged()) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const UserSessionState.notLogged());
      } else {
        emit(UserSessionState.logged(user: user));
      }
    });
  }

  Future<bool> loginOrRegister(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      toastification.show(
        title: Text('Success login $email'),
        alignment: Alignment.bottomCenter,
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 3),
      );
      return true;
    } catch (e) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        toastification.show(
          title: Text('Success of register $email'),
          alignment: Alignment.bottomCenter,
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 3),
        );
        return true;
      } catch (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'email-already-in-use') {
            toastification.show(
              title: const Text('Password is incorrect'),
              alignment: Alignment.bottomCenter,
              type: ToastificationType.error,
              autoCloseDuration: const Duration(seconds: 3),
            );
            return false;
          }
        }
      }
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      toastification.show(
        title: const Text('Success of logout'),
        alignment: Alignment.bottomCenter,
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 3),
      );
    } catch (e) {
      assert(false, e.toString());
    }
  }
}
