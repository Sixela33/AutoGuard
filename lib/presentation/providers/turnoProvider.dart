import 'package:autoguard/presentation/entities/Medic.dart';
import 'package:autoguard/presentation/entities/SacarTurnoEntity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final turnoProvider = StateNotifierProvider<turnoNotifier, SacarTurnoEntity>((ref) => turnoNotifier());

class turnoNotifier extends StateNotifier<SacarTurnoEntity> {
  turnoNotifier() : super(SacarTurnoEntity());

  void setIdSeleccionada(String id) async {
    state.idSeleccionada(id);
    state = state;
  }

  void setInputRazonConsulta(String razon) {
    state.setInputRazonConsulta(razon);
    state = state;
  }

  void setFechaSeleccionada(DateTime fecha) {
    state.setFechaSeleccionada(fecha);
    state = state;
  }

  Future<void> getMedicosOfEspecialidad() async {
    await state.getMedicosOfespecialidad();
    return;
  }

  Future<void> setMedicoSeleccionado(Medic medico) async {
    await state.setMedicoSeleccionado(medico);
    return;
  }
}

