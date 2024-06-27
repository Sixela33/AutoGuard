import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) {
  return ref.watch(databaseNotifierProvider);
});

class SacarTurnoEntity {
  late String especialidadSeleccionada;
  late String inputUsuarioRazonConsulta;
  late Medic medicoSeleccionado;
  List<Medic> medicosDisponibles = [];
  Database database = new Database();

  void setEspecialidadSeleccionada(String id) async {
    this.especialidadSeleccionada = id;
  }

  void setInputRazonConsulta(String razon) {
    this.inputUsuarioRazonConsulta = razon;
  }

  void setFechaSeleccionada(DateTime fecha) {
    
  }

  Future<void> getMedicosOfespecialidad() async {
    this.medicosDisponibles = await this.database.getMedicosOfEspecialidad(especialidadSeleccionada);
    return;
  }

  Future<void> setMedicoSeleccionado(Medic medico) async {
    medicoSeleccionado = medico;
    return;
  }

  void setTime (TimeOfDay time) {
    
  }

  get fechaSeleccionada => null;
}


