import 'package:autoguard/presentation/entities/DataEntities/EspecialidadMedica.dart';
import 'package:autoguard/presentation/entities/DataEntities/ObraSocial.dart';
import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:autoguard/presentation/entities/DataEntities/TurnoUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<ObraSocial> obrasSociales = [];
  List<EspecialidadMedica> especialidadesMedicas = [];

  static final Database _instance = Database._internal();

  Database._internal() {
    getObrasSociales();
    getEspecialidades();
  }

  // Factory constructor que retorna la misma instancia
  factory Database() {
    return _instance;
  }

  ///////////////////////////////////
  ///           AUTH
  ///////////////////////////////////

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  Future<void> registerWithEmailAndPassword(String email, String password, List<ObraSocial> obrasSociales) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      String userId = userCredential.user!.uid;

      Iterable<String> obras_sociales = obrasSociales.map((e) => e.nombre).toList();

      await _firestore.collection('users').doc(userId).set({
        'id': userId,
        'email': email,
        'es_medico': false,
        'obras_sociales': obras_sociales
      });

      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error en registro: $e');
      throw e;
    }
  }

  Future<void> registerWithEmailAndPasswordDoctor(String email, String password, String nombre, List<ObraSocial> obrasSociales, List<EspecialidadMedica> especialidadesMedicas) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      String userId = userCredential.user!.uid;

      Iterable<String> obras_sociales = obrasSociales.map((e) => e.nombre).toList();
      Iterable<String> especialidades = especialidadesMedicas.map((e) => e.nombre).toList();

      await _firestore.collection('users').doc(userId).set({
        'id': userId,
        'email': email,
        'nombre': nombre,
        'obras_sociales': obras_sociales,
        'especialidades': especialidades,
        'es_medico': true
      });

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return;
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

  ///////////////////////////////////
  ///       OBRAS SOCIALES
  ///////////////////////////////////

  Future<void> addObraSocial(String nombreObraSocial) async {
    try {
      String? userId = getCurrentUserId();
      if(nombreObraSocial.trim().isEmpty){
        throw Exception('el nombre de la obra social no puede estar vacio');
      }
      
      if (userId != null) {
        DocumentReference docRef = _firestore.collection('obraSocial').doc();
        await docRef.set({
          'id': docRef.id, 
          'nombre': nombreObraSocial,
      });

      return;
      } else {
        throw Exception("Usuario no autenticado");
      }

    } catch (e) {
      rethrow;
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
        try {
          ObraSocial obraSocial = ObraSocial.fromMap(data);
          obrasSociales.add(obraSocial);
        } catch (e) {
          continue;
        }
      }
      
      this.obrasSociales = obrasSociales;
      return obrasSociales;

    } catch (e) {
      print('Error al fetchear obras sociales: $e');
      throw e;
    }
  }

  ///////////////////////////////////
  ///    ESPECIALIDADES MEDICAS
  ///////////////////////////////////

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
      //print('especialidad agregada con ID: ${docRef.id}');
      throw'Especialidad agregada';

      } else {
        throw 'Usuario no autenticado';
      }
    } catch (e) {
      print('Error al agregar obra social: $e');
      rethrow;
    }
  }

  Future<List<EspecialidadMedica>> getEspecialidades() async {
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
    return especialidades;
  }

  ///////////////////////////////////
  ///          MEDICOS
  ///////////////////////////////////


  Future<List<Medic>> getMedicosOfEspecialidad(String especialidad) async {
    Query medicosQuery = _firestore.collection('users').where('es_medico', isEqualTo: true).where('especialidades', arrayContains: especialidad);
    QuerySnapshot querySnapshot = await medicosQuery.get();
    List<Medic> medicos = [];
    for (DocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      try {
        Medic medic = Medic.fromMap(data);
        medicos.add(medic);
      } catch (e) {
        print(e);
        continue;
      }
    }
    print(medicos);
    return medicos;
  }

  Future<Medic> getMedicoByID(String id) async {
    Query medicoQuery = _firestore.collection('users').where('es_medico', isEqualTo: true).where('id', isEqualTo: id);
    QuerySnapshot querySnapshot = await medicoQuery.get();
    
    if (querySnapshot.docs.isEmpty) {
      throw Exception('Medico no encontrado');
    }

    Map<String, dynamic> data = querySnapshot.docs[0].data() as Map<String, dynamic>;
    return Medic.fromMap(data);
  }

  void agendarTurnoMedico(String especialidadSeleccionada, DateTime fechaSeleccionada, String inputUsuarioRazonConsulta, Medic medicoSeleccionado) async {
    try {
      String? userId = getCurrentUserId();
      String medicID = medicoSeleccionado.id;

      if (userId != null) {

        DocumentReference medicoTurnoDocRef = _firestore.collection('users').doc(medicID).collection('turnos_medico').doc();
        DocumentReference usuarioTurnoDocRef = _firestore.collection('users').doc(userId).collection('turnos').doc();

        Map<String, dynamic> nuevoTurno = {
          'id': medicoTurnoDocRef.id, // Usar el id del documento
          'especialidad': especialidadSeleccionada,
          'fecha_hora': fechaSeleccionada,
          'razon_consulta': inputUsuarioRazonConsulta,
          'estado': "pendiente",
          'paciente_id': userId,
          'medico_id': medicoTurnoDocRef.id
        };

        WriteBatch batch = _firestore.batch();

        batch.set(medicoTurnoDocRef, nuevoTurno);
        batch.set(usuarioTurnoDocRef, nuevoTurno);

        await batch.commit();

        print("Turno agendado exitosamente en ambas colecciones.");
      } else {
        throw Exception("Usuario no autenticado");
      }
    } catch (e) {
      rethrow;
    }
  }

  void getTurnosUsuario() async {
    try {
      String? userId = getCurrentUserId();
      if (userId != null) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('turnos')
            .get();

        List<TurnoUser> turnos = snapshot.docs.map((doc) {
          return TurnoUser.fromMap(doc.data() as Map<String, dynamic>, doc.id);
        }).toList();

        print("Turnos del usuario obtenidos exitosamente.");
        for (var turno in turnos) {
          print(turno);
        }
      } else {
        throw Exception("Usuario no autenticado");
      }
    } catch (e) {
      rethrow;
    }
  }



}