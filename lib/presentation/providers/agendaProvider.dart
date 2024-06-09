import 'dart:core';

import 'package:autoguard/core/Agenda/AgendaRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final agendaProvider = StateNotifierProvider<AgendaNotifier, AgendaInput>((ref) => AgendaNotifier());

class AgendaInput {
  int? fromTime;
  int? toTime;
  int? interval;
  DateTime? dateFrom;
  DateTime? dateTo;
  List<bool>? days;

  AgendaInput() {
    days = List.generate(7, (index) => false);
  }

  AgendaInput copyWith({ int? fromTime, int? toTime, int? interval, DateTime? dateFrom, DateTime? dateTo, List<bool>? days }) {
    return AgendaInput()
      ..fromTime = fromTime ?? this.fromTime
      ..toTime = toTime ?? this.toTime
      ..interval = interval ?? this.interval
      ..dateFrom = dateFrom ?? this.dateFrom
      ..dateTo = dateTo ?? this.dateTo
      ..days = days ?? this.days;
  }
}

class AgendaNotifier extends StateNotifier<AgendaInput> {
  AgendaNotifier() : super(AgendaInput());

  void setFromTime(int? fromTime) {
    state = state.copyWith(fromTime: fromTime);
  }

  void setToTime(int? toTime) {
    state = state.copyWith(toTime: toTime);
  }

  void setInterval(int? interval) {
    state = state.copyWith(interval: interval);
  }

  void setDateFrom(DateTime? dateFrom) {
    state = state.copyWith(dateFrom: dateFrom);
  }

  void setDateTo(DateTime? dateTo) {
    state = state.copyWith(dateTo: dateTo);
  }

  void setDays(List<bool>? days) {
    state = state.copyWith(days: days);
  }

  void reset() {
    state = AgendaInput();
  }

  void actualizarAgenda() {
    guardarAgenda(state);
  }
}
