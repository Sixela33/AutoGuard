import 'package:autoguard/presentation/entities/Cita.dart';
import 'package:autoguard/presentation/providers/agendaProvider.dart';

abstract interface class AgendaProxy{
  Future<List<Cita>> getCitasLibresMedico(String medico);
  void ocuparCita(String idCita);
  void guardarAgenda(AgendaInput agenda);
}