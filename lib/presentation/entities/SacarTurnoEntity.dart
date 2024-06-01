import 'package:autoguard/presentation/entities/Firebase.dart';
import 'package:autoguard/presentation/entities/Medic.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<Database>((ref) {
  return ref.watch(databaseNotifierProvider);
});

class SacarTurnoEntity {
  late String idEspecialidadSeleccionada;
  late String inputUsuarioRazonConsulta;
  late DateTime fechaSeleccionada;
  late List<Medic> medicosDisponibles;

  void idSeleccionada(String id) async {
    this.idEspecialidadSeleccionada = id;
  }

  void setInputRazonConsulta(String razon) {
    this.inputUsuarioRazonConsulta = razon;
  }

  void setFechaSeleccionada(DateTime fecha) {
    this.fechaSeleccionada = fecha;
  }

}