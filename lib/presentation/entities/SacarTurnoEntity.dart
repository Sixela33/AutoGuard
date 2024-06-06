import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/entities/Medic.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) {
  return ref.watch(databaseNotifierProvider);
});

class SacarTurnoEntity {
  late String idEspecialidadSeleccionada;
  late String inputUsuarioRazonConsulta;
  late DateTime fechaSeleccionada;
  late Medic medicoSeleccionado;
  List<Medic> medicosDisponibles = [];
  Database database = new Database();

  void idSeleccionada(String id) async {
    this.idEspecialidadSeleccionada = id;
  }

  void setInputRazonConsulta(String razon) {
    this.inputUsuarioRazonConsulta = razon;
  }

  void setFechaSeleccionada(DateTime fecha) {
    this.fechaSeleccionada = fecha;
  }

  Future<void> getMedicosOfespecialidad() async {
    this.medicosDisponibles = await this.database.getMedicosOfEspecialidad(idEspecialidadSeleccionada);
    return;
  }

  Future<void> setMedicoSeleccionado(Medic medico) async {
    medicoSeleccionado = medico;
    return;
  }

  void setTime (TimeOfDay time) {
    fechaSeleccionada = DateTime(
      fechaSeleccionada.year,
      fechaSeleccionada.month,
      fechaSeleccionada.day,
      time.hour,
      time.minute,
      fechaSeleccionada.second,
      fechaSeleccionada.millisecond,
      fechaSeleccionada.microsecond,
    );

  }
}


