import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  ///////////////////////////////////
  ///           AUTH
  ///////////////////////////////////

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      String userId = userCredential.user!.uid;

      await _firestore.collection('users').doc(userId).set({
        'id': userId,
        'email': email,
      });

      await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  ///////////////////////////////////
  ///         FIRESTORE
  ///////////////////////////////////

  Future<void> addObraSocial(String nombreObraSocial) async {
    try {
      String? userId = getCurrentUserId();
      if (userId != null) {
        DocumentReference docRef = _firestore.collection('obraSocial').doc();
        await docRef.set({
          'id': docRef.id, 
          'nombre': nombreObraSocial,
      });
      print('Obra social agregada con ID: ${docRef.id}');
      } else {
        throw Exception('Usuario no autenticado');
      }
    } catch (e) {
      print('Error al agregar obra social: $e');
      throw e;
    }
  }

  // GetObrasSociales

  // Agregar Especialidad
    Future<void> addEspecialidad(String nombreEspecialidad) async {
    try {
      String? userId = getCurrentUserId();
      if (userId != null) {
        DocumentReference docRef = _firestore.collection('especialidad').doc();
        await docRef.set({
          'id': docRef.id, 
          'nombre': nombreEspecialidad,
      });
      print('especialidad agregada con ID: ${docRef.id}');
      } else {
        throw Exception('Usuario no autenticado');
      }
    } catch (e) {
      print('Error al agregar obra social: $e');
      throw e;
    }
  }
  // Get especialidades
  // 
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
