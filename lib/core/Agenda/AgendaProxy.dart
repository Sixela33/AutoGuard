import 'package:autoguard/presentation/entities/Cita.dart';

abstract interface class AgendaProxy{
  Future<List<Cita>> getCitasLibresMedico(String medico);
}