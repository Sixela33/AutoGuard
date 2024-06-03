import 'dart:async';
import 'dart:math';

import 'package:autoguard/core/Turnos/TurnosProxy.dart';
import 'package:autoguard/core/Turnos/turnos.dart';
import 'package:autoguard/core/User/UserRepository.dart';
import 'package:autoguard/presentation/entities/Cita.dart';
import 'package:autoguard/presentation/entities/Turno.dart';

class TurnosProxyFs implements TurnosProxy {

  TurnosProxyFs();

  @override
  void registrarTurno(Cita cita) {
    var turno = Turno.fromCita(cita);
    turno.id = Random().nextInt(1000).toString();
    
    getActiveUser().then((value) => {
      turno.paciente = value.id, 
      turnos.add(turno),
      cita.libre = false,
      });
  }
  
  @override
  Future<List<Turno>> getTurnos() {
    return getActiveUser().then((value) => turnos.where((element) => element.paciente == value.id).toList());
  }
}