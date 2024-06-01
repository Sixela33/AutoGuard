import 'package:autoguard/presentation/entities/SacarTurnoEntity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final turnoProvider = StateNotifierProvider<turnoNotifier, SacarTurnoEntity>((ref) => turnoNotifier());

class turnoNotifier extends StateNotifier<SacarTurnoEntity> {
  turnoNotifier() : super(SacarTurnoEntity());

  void setIdSeleccionada(String id) async {
    state.idSeleccionada(id);
  }

  void setInputRazonConsulta(String razon) {
    state.setInputRazonConsulta(razon);
  }

  void setFechaSeleccionada(DateTime fecha) {
    state.setFechaSeleccionada(fecha);
  }
}