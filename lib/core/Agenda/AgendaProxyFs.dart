import 'dart:math';

import 'package:autoguard/core/Agenda/AgendaProxy.dart';
import 'package:autoguard/core/Agenda/agenda.dart';
import 'package:autoguard/core/User/UserRepository.dart';
import 'package:autoguard/presentation/entities/Cita.dart';
import 'package:autoguard/presentation/providers/agendaProvider.dart';
import 'package:flutter/material.dart';

class AgendaProxyFs implements AgendaProxy {

  AgendaProxyFs();

  @override
  Future<List<Cita>> getCitasLibresMedico(String idMedico) {
    return Future.value(agenda.where((element) => element.idMedico == idMedico && element.libre).toList());
  }
  
  @override
  void ocuparCita(String idCita) {
    agenda.firstWhere((element) => element.id == idCita).libre = false;
  }

  @override
  void guardarAgenda(AgendaInput agenda) async {
    var day = agenda.dateFrom;
    var until = agenda.dateTo;
    
    
    while(day!.isBefore(until!)) {
      if (agenda.days![day.weekday - 1]) {
        var fromTime = agenda.fromTime;
        while(fromTime! < agenda.toTime!) {
        var cita = Cita(
          id: Random().nextInt(1000).toString(),
          idMedico: (await getActiveUser()).id,
          fecha: day.add(Duration(minutes: fromTime)),
          libre: true
        );
        guardarTurno(cita);
        fromTime += agenda.interval!;
      }
      }
      day = day.add(Duration(days: 1));
    }
  }

  void guardarTurno(Cita cita) {
    agenda.add(cita);
  }

  
}