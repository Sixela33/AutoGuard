import 'package:autoguard/presentation/screens/sacar_turno/SacarTunroScreen.dart';
import 'package:flutter/material.dart';

List<Step> getSteps() => [
  const Step(
    title: Text("chat"),
    content: SacarTunroScreen()
  ),
  const Step(
    title: Text("calendar"), 
    content: Placeholder()),
  const Step(
    title: Text("TimeSelector"), 
    content: Placeholder())
  ];
