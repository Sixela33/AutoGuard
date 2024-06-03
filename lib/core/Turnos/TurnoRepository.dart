import 'package:autoguard/core/Turnos/TurnosProxy.dart';
import 'package:autoguard/core/Turnos/TurnosProxyFs.dart';
import 'package:autoguard/presentation/entities/Cita.dart';
import 'package:autoguard/presentation/entities/Turno.dart';

TurnosProxy turnosProxy = TurnosProxyFs();

void registrarTurno(Cita cita) {
  turnosProxy.registrarTurno(cita);
}

Future<List<Turno>> getTurnos() {
  return turnosProxy.getTurnos();
}