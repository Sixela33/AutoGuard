

import 'package:intl/intl.dart';

DateFormat formatFecha = DateFormat("dd-MM-yyyy");
DateFormat formatHora = DateFormat("HH:mm");

class Cita {

  final String id;
  final String idMedico;
  bool libre;
  final DateTime fecha;

  Cita({required this.id, required this.idMedico, required this.libre, required this.fecha});

  String getFecha() {
    return formatFecha.format(fecha);
  }

  String getHora() {
    return formatHora.format(fecha);
  }
}