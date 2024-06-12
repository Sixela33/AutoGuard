import 'dart:math';

import 'package:autoguard/presentation/entities/Cita.dart';

class Turno {
  String? id;
  String fecha;
  String estado;
  String? paciente;
  String medico;

  Turno({this.id, required this.fecha, required this.estado, this.paciente, required this.medico});

  factory Turno.fromCita(Cita cita) => Turno(
    fecha: cita.getFecha(),
    estado: "Pendiente",
    medico: cita.idMedico
  );

}