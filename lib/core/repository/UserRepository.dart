import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  Future<Usuario> getUsuario(String id) async {
    final snapshot = await _firestore.collection('users').doc(id).get();
    return Usuario.fromMap(snapshot.data()!);
  }
}

final userRepositoryProvider = Provider((ref) => UserRepository(ref.read(firebaseFirestoreProvider)));