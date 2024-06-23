import 'package:autoguard/presentation/entities/DataEntities/EstadoTurno.dart';
import 'package:autoguard/presentation/entities/DataEntities/Turno.dart';
import 'package:autoguard/presentation/entities/DetalleClinico.dart';
import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/providers/userProvider.dart';
import 'package:autoguard/presentation/providers/utilProviders.dart';
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

final turnosQueryProvider = Provider.family<Query<Turno>, Set<EstadoTurno>>((ref, filters) {
  final firestore = ref.read(firebaseFirestoreProvider);
  final user = ref.read(userProvider);
  var turnosQuery = firestore.collection("turnos").withConverter<Turno>(fromFirestore: (snapshot, _) => Turno.fromMap(snapshot.data()!, snapshot.id), toFirestore: (turno, _) => turno.toMap())
  .where("medico_id", isEqualTo: user!.id);
  if (filters.isNotEmpty) {
    turnosQuery = turnosQuery.where("estado", whereIn: filters.map((e) => e.toString()));
  }
  turnosQuery = turnosQuery.orderBy("fecha_hora", descending: false);

  return turnosQuery;
} );

final getDiasDisponiblesProvider = FutureProvider<List<String>>((ref) {
  final firestore = ref.read(firebaseFirestoreProvider);
  final dateFormat = ref.read(dateFormatProvider);
  return firestore.collection("turnos")
  .withConverter(fromFirestore: (snapshot,_) => Turno.fromMap(snapshot.data()!, snapshot.id), toFirestore: (turno, _) => turno.toMap())
  .get().then((value) => value.docs.map((e) => dateFormat.format(e.data().fechaHora)).toSet().toList());
});