import 'package:autoguard/presentation/entities/DataEntities/EstadoTurno.dart';
import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Turno {
  final String id;
  final DateTime fechaHora;
  final String razonConsulta;
  final EstadoTurno estado;
  final String especialidadSeleccionada;
  final String medicoName;
  final String medicoID;
  final String pacienteID;

  Turno({
    required this.id,
    required this.fechaHora,
    required this.razonConsulta,
    required this.estado,
    required this.medicoName,
    required this.medicoID,
    required this.pacienteID,
    required this.especialidadSeleccionada
  });

  factory Turno.fromMap(Map<String, dynamic> data, String documentId) {

    return Turno(
      id: documentId,
      fechaHora: (data['fecha_hora'] as Timestamp).toDate(),
      razonConsulta: data['razon_consulta'],
      estado: EstadoTurno.values.firstWhere((e) => e.toString() == data['estado']),
      medicoName: data['medico_name'],
      medicoID: data['medico_id'],
      pacienteID: data['paciente_id'],
      especialidadSeleccionada: data['especialidad']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha_hora': fechaHora,
      'razon_consulta': razonConsulta,
      'estado': estado.toString(),
      'medico_name': medicoName,
      'medico_id': medicoID,
      'paciente_id': pacienteID,
      'especialidad': especialidadSeleccionada,
    };
  }
}