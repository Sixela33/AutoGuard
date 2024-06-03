import 'package:autoguard/core/Agenda/AgendaProxy.dart';
import 'package:autoguard/core/Agenda/agenda.dart';
import 'package:autoguard/presentation/entities/Cita.dart';

class AgendaProxyFs implements AgendaProxy {

  AgendaProxyFs();

  @override
  Future<List<Cita>> getCitasLibresMedico(String idMedico) {
    return Future.value(agenda.where((element) => element.idMedico == idMedico && element.libre).toList());
  }
}