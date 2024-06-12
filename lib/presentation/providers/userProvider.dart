import 'package:autoguard/presentation/entities/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, Usuario>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<Usuario> {
  UserNotifier() : super(Usuario());

  void setUser(Usuario user) {
    state = user;
  }

  void login() {
    var user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((value) {
      state = Usuario.fromMap(value.data()!);
    });
  }

  void logout() {
    state = Usuario();
  }
}