import 'package:autoguard/presentation/screens/sacar_turno/ConsultarEspecialista.dart';
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
      content: Placeholder()),
    Step(
      isActive: step >= 2,
      title: Text("TimeSelector"),
      content: Placeholder())
    ];