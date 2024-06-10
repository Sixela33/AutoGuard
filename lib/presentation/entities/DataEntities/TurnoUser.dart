import 'package:autoguard/presentation/entities/DataEntities/EstadoTurno.dart';
import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TurnoUser {
  final String id;
  final DateTime fechaHora;
  final String razonConsulta;
  final EstadoTurno estado;
  final String medicoName;
  final String medicoID;

  TurnoUser({
    required this.id,
    required this.fechaHora,
    required this.razonConsulta,
    required this.estado,
    required this.medicoName,
    required this.medicoID,
  });

  factory TurnoUser.fromMap(Map<String, dynamic> data, String documentId) {
    
    return TurnoUser(
      id: documentId,
      fechaHora: (data['fecha_hora'] as Timestamp).toDate(),
      razonConsulta: data['razon_consulta'],
      estado: EstadoTurno.values.firstWhere((e) => e.toString() == data['estado']),
      medicoName: data['medico_name'],
      medicoID: data['medico_id'],
    );
  }
}