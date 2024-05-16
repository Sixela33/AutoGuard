import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error en registro: $e');
      throw e;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error al iniciar sesión: $e');
      throw e;
    }
  }

  Future<void> addObraSocial(String nombreObraSocial) async {
    try {
      String? userId = getCurrentUserId();
      if (userId != null) {
        var response = await _firestore.collection('users/$userId/obraSocial').add({
          'nombre': nombreObraSocial,
        });
        print(response);
      } else {
        throw Exception('Usuario no autenticado');
      }
    } catch (e) {
      print('Error al agregar obra social: $e');
      throw e;
    }
  }
}

final databaseNotifierProvider = StateNotifierProvider<DatabaseNotifier, Database>((ref) => DatabaseNotifier());

class DatabaseNotifier extends StateNotifier<Database> {
  DatabaseNotifier() : super(Database());

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    await state.registerWithEmailAndPassword(email, password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await state.signInWithEmailAndPassword(email, password);
  }

  Future<void> addObraSocial(String nombreObraSocial) async {
    await state.addObraSocial(nombreObraSocial);
  }
}
