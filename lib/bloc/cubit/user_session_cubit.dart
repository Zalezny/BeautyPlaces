import 'package:beauty_places/data/firestore/write_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';

import '../../data/models/comment_model.dart';
import '../../services/injection.dart';

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
      return await _register(email, password);
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      toastification.show(
        title: const Text('Wylogowano'),
        alignment: Alignment.bottomCenter,
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 3),
      );
    } catch (e) {
      assert(false, e.toString());
    }
  }

  bool areYouComment(List<CommentModel> comments) {
    if (state is _NotLogged) {
      return false;
    } else {
      final user = (state as _Logged).user;
      return comments.any((element) => element.ownerId == user.uid);
    }
  }

  Future<bool> _register(String email, String password) async {
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
      final user = FirebaseAuth.instance.currentUser;
      await getIt<WriteRepository>().createUser(email, user!.uid);
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
    return true;
  }
}
