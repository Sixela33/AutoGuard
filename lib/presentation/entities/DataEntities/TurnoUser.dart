import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum EstadoTurno { pendiente, enProgreso, finalizado }

class TurnoUser {
  final String id;
  final Medic medico;
  final DateTime fechaHora;
  final String razonConsulta;
  final EstadoTurno estado;

  TurnoUser({
    required this.id,
    required this.medico,
    required this.fechaHora,
    required this.razonConsulta,
    required this.estado
  });

  factory TurnoUser.fromMap(Map<String, dynamic> data, String documentId) {
    return TurnoUser(
      id: documentId,
      medico: Medic.fromMap(data['medico']),
      fechaHora: (data['fecha_hora'] as Timestamp).toDate(),
      razonConsulta: data['razon_consulta'],
      estado: EstadoTurno.values.firstWhere((e) => e.toString() == 'EstadoTurno.' + data['estado']),
    );
  }
}


