import 'package:autoguard/presentation/entities/EspecialidadMedica.dart';
import 'package:autoguard/presentation/entities/ObraSocial.dart';
import 'package:autoguard/presentation/entities/ResponseObject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<ObraSocial> obrasSociales = [];
  List<EspecialidadMedica> especialidadesMedicas = [];

  Database () {
    getObrasSociales();
    getEspecialidades();
  }

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

  Future<ResponseObject> addObraSocial(String nombreObraSocial) async {
    try {
      String? userId = getCurrentUserId();
      if(nombreObraSocial.trim().isEmpty){
        return new ResponseObject(success: false, mensaje: 'el nombre de la obra social no puede estar vacio');
      }
      
      if (userId != null) {
        DocumentReference docRef = _firestore.collection('obraSocial').doc();
        await docRef.set({
          'id': docRef.id, 
          'nombre': nombreObraSocial,
      });

      return new ResponseObject(success: true, mensaje: 'Obra social agregada con exito');
      } else {
        // throw Exception('Usuario no autenticado');
        return new ResponseObject(success: false, mensaje: 'Usuario no autenticado');
      }

    } catch (e) {
      return new ResponseObject(success: false, mensaje: e.toString());
    }
  }

  // GetObrasSociales
  void getObrasSociales() async {
    try {
      Query obraSocialQuery = _firestore.collection('obraSocial');
      QuerySnapshot response = await obraSocialQuery.get();
      
      List<ObraSocial> obrasSociales = [];
      for (DocumentSnapshot doc in response.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        try {
          ObraSocial obraSocial = ObraSocial.fromMap(data);
          obrasSociales.add(obraSocial);
        } catch (e) {
          continue;
        }
      }
      this.obrasSociales = obrasSociales;

    } catch (e) {
      print('Error al fetchear obras sociales: $e');
      throw e;
    }
  }

  // Agregar Especialidad
  Future<ResponseObject> addEspecialidad(String nombreEspecialidad) async {
    try {
      String? userId = getCurrentUserId();
      if (userId != null) {
        DocumentReference docRef = _firestore.collection('especialidad').doc();
        await docRef.set({
          'id': docRef.id, 
          'nombre': nombreEspecialidad,
      });
      //print('especialidad agregada con ID: ${docRef.id}');
      return new ResponseObject(success: false, mensaje: 'Especialidad agregada');

      } else {
        return new ResponseObject(success: false, mensaje: 'Usuario no autenticado');
      }
    } catch (e) {
      print('Error al agregar obra social: $e');
      return new ResponseObject(success: false, mensaje: e.toString());
    }
  }

  void getEspecialidades() async {
    Query especialidadQuery = _firestore.collection('especialidad');
    QuerySnapshot querySnapshot = await especialidadQuery.get();
    List<EspecialidadMedica> especialidades = [];
    for (DocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
         try {
            EspecialidadMedica especialidad = EspecialidadMedica.fromMap(data);
            especialidades.add(especialidad);
        } catch (e) {
          print(e);
          continue;
        }
      
    }

    this.especialidadesMedicas = especialidades;
  }
}