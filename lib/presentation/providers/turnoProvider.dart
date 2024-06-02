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

  void nextStep() {
    state.currentStep++;
    state = state; 
  }

  void lastStep() {
    state.currentStep--;
    state = state;
  }

  int getCurrentStep() {
    print("se llama a get currentStep");
    return state.currentStep;
  }
}

