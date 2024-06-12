import 'package:flutter/material.dart';

class Medic {
  final String id;
  final String nombre;
  final String email;
  final List<String> especialidades;
  final List<String> obras_sociales;
  final bool es_medico;
  int duracionTurno;
  TimeOfDay horaApertura;
  TimeOfDay horaCierre;

  Medic({
    required this.email,
    required this.especialidades,
    required this.obras_sociales,
    required this.es_medico,
    required this.id,
    required this.nombre,
    this.horaApertura = const TimeOfDay(hour: 8, minute: 0),
    this.horaCierre = const TimeOfDay(hour: 18, minute: 0),
    this.duracionTurno = 30,
  });

  factory Medic.fromMap(Map<String, dynamic> data) {
    Medic temp_medic = Medic( 
      email: data['email'] as String,
      id: data['id'] as String,
      nombre: data['nombre'] as String,
      especialidades: List<String>.from(data['especialidades'] as List<dynamic>),
      obras_sociales: List<String>.from(data['obras_sociales'] as List<dynamic>),
      es_medico: data['es_medico'] ? data['es_medico']  as bool : false
      );
    
    if(data['hora_apertura'] != null) {
      temp_medic.horaApertura =  data['hora_apertura'] as TimeOfDay;
    }

    if(data['hora_cierre']!= null) {
      temp_medic.horaCierre =  data['hora_cierre'] as TimeOfDay;
    }
    
    if(data['duracion_turno']!= null) {
      temp_medic.duracionTurno =  data['duracion_turno'] as int;
    }

    return temp_medic;
  }
}
