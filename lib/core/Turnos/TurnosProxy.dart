import 'package:autoguard/presentation/entities/Cita.dart';
import 'package:autoguard/presentation/entities/Turno.dart';

abstract interface class TurnosProxy {
  void registrarTurno(Cita cita);
  Future<List<Turno>> getTurnos();
}