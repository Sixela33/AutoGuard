import 'package:autoguard/core/Agenda/AgendaProxy.dart';
import 'package:autoguard/core/Agenda/AgendaProxyFs.dart';
import 'package:autoguard/presentation/entities/Cita.dart';

final AgendaProxy agendaProxy = AgendaProxyFs();

Future<List<Cita>> getCitasLibresMedico(String idMedico) async {
  return agendaProxy.getCitasLibresMedico(idMedico);
}

void ocuparCita(String idCita) {
  agendaProxy.ocuparCita(idCita);
}