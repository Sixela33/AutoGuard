import 'package:autoguard/presentation/entities/DataEntities/EstadoTurno.dart';
import 'package:autoguard/presentation/entities/DataEntities/Turno.dart';
import 'package:autoguard/presentation/entities/DetalleClinico.dart';
import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Turnorepository {
  final FirebaseFirestore _firestore;
  Turnorepository(this._firestore);

  Future<void> finalizarTurno(String id, String diagnostico, String tratamiento) async {
    await _firestore.collection('turnos').doc(id).update({'estado': EstadoTurno.finalizado.toString(),
    'diagnostico': diagnostico, 'tratamiento': tratamiento});
  }

  Future<Turno> getTurno(String id) async {
    final snapshot = await _firestore.collection('turnos').doc(id).get();
    return Turno.fromMap(snapshot.data()!, snapshot.id);
  }

  Future<List<DetalleClinico>> getHistoriaClinica(String userId) async {
    return _firestore.collection("turnos")
    .withConverter(fromFirestore: (snapshot, _) => 
      DetalleClinico.fromMap(snapshot.data()!), toFirestore: (detalle, _) => detalle.toMap())
    .where("paciente_id", isEqualTo: userId)
    .where("estado", isEqualTo: EstadoTurno.finalizado.toString())
    .where("diagnostico", isNull: false)
    .orderBy("fecha_hora", descending: true)
    .get().then((value) => value.docs.map((e) => e.data()).toList());
}

Future<void> nuevoTurno(DateTime fecha, String medico) {
  return _firestore.collection('turnos').add({
    'fecha_hora': fecha,
    'medico_id': medico,
    'estado': EstadoTurno.pendiente.toString()
  });
}
}

final turnoRepositoryProvider = Provider((ref) => Turnorepository(ref.read(firebaseFirestoreProvider)));