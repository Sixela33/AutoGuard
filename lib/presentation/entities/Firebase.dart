import 'package:autoguard/presentation/entities/EspecialidadMedica.dart';
import 'package:autoguard/presentation/entities/ObraSocial.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future<List<ObraSocial>> getObrasSociales() async {
    try {
      Query obraSocialQuery = _firestore.collection('obraSocial');
      QuerySnapshot response = await obraSocialQuery.get();
      
      List<ObraSocial> obrasSociales = [];
      for (DocumentSnapshot doc in response.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        ObraSocial obraSocial = ObraSocial.fromMap(data);
        obrasSociales.add(obraSocial);
      }
      
      return obrasSociales;

    } catch (e) {
      print('Error al agregar obra social: $e');
      throw e;
    }
  }

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
  Future<List<EspecialidadMedica>> getEspecialidades() async {
    // Fetch especialidad data from Firestore
    Query especialidadQuery = _firestore.collection('especialidad');
    QuerySnapshot querySnapshot = await especialidadQuery.get();

    // Convert Firestore documents to Especialidad objects
    List<EspecialidadMedica> especialidades = [];
    for (DocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      EspecialidadMedica especialidad = EspecialidadMedica.fromMap(data);
      especialidades.add(especialidad);
    }

    return especialidades;
  }
}