import 'package:autoguard/presentation/entities/DataEntities/EstadoTurno.dart';
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
}

final turnoRepositoryProvider = Provider((ref) => Turnorepository(ref.read(firebaseFirestoreProvider)));