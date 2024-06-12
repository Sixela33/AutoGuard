import 'package:autoguard/core/User/UserDAO.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDaoFirebase implements UserDAO {
  UserDaoFirebase();

  @override
  Future<Usuario> getActiveUser() {
    var user = FirebaseAuth.instance.currentUser;
    return getUserById(user!.uid);
  }

  @override
  Future<List<Usuario>> getMedicosEspecialidad(String especialidad) {
    throw UnimplementedError();
  }

  @override
  Future<List<String?>> getEspecialidades() {
    throw UnimplementedError();
  }

  Future<Usuario> getUserById(String id) {
    return FirebaseFirestore.instance.collection('users').doc(id).get().then((value) {
      return Usuario.fromMap(value.data()!);
    });
  }
}