import 'package:autoguard/presentation/screens/sacar_turno/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarFecha.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarMedico.dart';
import 'package:flutter/material.dart';

List<Step> getSteps(step) => [
    Step(
      isActive: step >= 0,
      title: Text("chat"),
      content: ConsultarEspecialista()
    ),
    Step(
      isActive: step >= 1,
      title: Text("calendar"),
      content: SeleccionarMedico()),
    Step(
      isActive: step >= 2,
      title: Text("TimeSelector"),
      content: SeleccionarFecha())
    ];