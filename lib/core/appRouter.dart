import 'dart:convert';

import 'package:autoguard/core/User/UserRepository.dart';
import 'package:autoguard/presentation/entities/Usuario.dart';
import 'package:autoguard/presentation/screens/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/ConsultarTurnosScreen.dart';
import 'package:autoguard/presentation/screens/MenuMedico.dart';
import 'package:autoguard/presentation/screens/MenuPaciente.dart';
import 'package:autoguard/presentation/screens/NuevaConsultaScreen.dart';
import 'package:autoguard/presentation/screens/PerfilScreen.dart';
import 'package:autoguard/presentation/screens/ProfesionalesScreen.dart';
import 'package:autoguard/presentation/screens/TurnosScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => FutureBuilder(
      future: getActiveUser(), 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data as Usuario;
          if (user.esMedico) {
            return MenuMedico();
          } else {
            return MenuPaciente();
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
      ),
  ),
  GoRoute(
    path: "/perfil",
    builder: (context, state) => PerfilScreen(),
  ),
  GoRoute(
    path: "/especialista",
    builder: (context, state) => ConsultarEspecialista(),
  ),
  GoRoute(
    path: "/profesionales",
    builder: (context, state) =>
        ProfesionalesScreen(especialidad: state.extra as String),
  ),
  GoRoute(
    path: "/turnos",
    builder: (context, state) => TurnosScreen(idMedico: state.extra as String),
  ),
  GoRoute(
    path: "/consultas",
    builder: (context, state) => ConsultarTurnosScreen(),
  ),
]);
