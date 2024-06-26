import 'package:autoguard/presentation/entities/DataEntities/Turno.dart';
import 'package:autoguard/presentation/screens/AdminScreen.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';
import 'package:autoguard/presentation/screens/MenuScreen.dart';
import 'package:autoguard/presentation/screens/MisTurnosUser.dart';
import 'package:autoguard/presentation/screens/PerfilScreen.dart';
import 'package:autoguard/presentation/screens/RegistrarMedico.dart';
import 'package:autoguard/presentation/screens/RegistrationScreen.dart';
import 'package:autoguard/presentation/screens/TurnoInfoScreen.dart';
import 'package:autoguard/presentation/screens/TurnoMedico.dart';
import 'package:autoguard/presentation/screens/TurnosMedico.dart';
import 'package:autoguard/presentation/screens/agenda/AgendaScreen.dart';
import 'package:autoguard/presentation/screens/sacar_turno/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarFecha.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarHora.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarMedico.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/login", 
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: "/registro",
      builder: (context, state) => RegistrationScreen(),
    ),
    GoRoute(
      path: "/registroMedico",
      builder: (context, state) => RegistroMedicoScreen(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => MenuScreen(),
    ),
    GoRoute(
      path: "/perfil",
      builder: (context, state) => PerfilScreen(),
    ),
    GoRoute(
        path: "/sacarTurno",
        builder: (context, state) => ConsultarEspecialista(),
        routes: [
          GoRoute(
              path: 'seleccionarEspecialista',
              builder: (context, state) => SeleccionarMedico()),
          GoRoute(
              path: 'seleccionarFecha',
              builder: (context, state) => SeleccionarFecha()),
          GoRoute(
            path: 'seleccionarHora',
            builder: (context, state) => SeleccionarHora(),
          )
        ]),
    GoRoute(
      path: "/misTurnosUser",
      builder: (context, state) => MisTurnosUser(),
    ),
    GoRoute(
      path: '/misTurnosUser/:id',
      builder: (context, state) {
        final turno = state.extra as Turno;
        return TurnoInfoScreen(turno: turno);
      },
    ),
    GoRoute(
      path: "/turnos",
      builder: (context, state) => TurnosMedico(),
    ),
    GoRoute(
      path: "/detalleTurno",
      builder: (context, state) => TurnoMedico(turno: state.extra as String),
    ),
    GoRoute(
      path: "/consultas",
      builder: (context, state) => MisTurnosUser(),
    ),
    GoRoute(
      path: "/agenda",
      builder: (context, state) => AgendaScreen(),
    ),
    GoRoute(
      path: "/admin",
      builder: (context, state) => AdminScreen(),
    )
  ]
);
