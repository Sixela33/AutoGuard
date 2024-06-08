import 'package:autoguard/presentation/components/ScaffoldWithNavbar.dart';
import 'package:autoguard/presentation/screens/AdminScreen.dart';
import 'package:autoguard/presentation/screens/AgregarObraSocialUsuario.dart';
import 'package:autoguard/presentation/screens/MisTurnosUser.dart';
import 'package:autoguard/presentation/screens/sacar_turno/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/HomeScreen.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';
import 'package:autoguard/presentation/screens/RegistrationScreen.dart';
import 'package:autoguard/presentation/screens/WelcomeScreen.dart';
import 'package:autoguard/presentation/screens/RegistrarMedico.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarFecha.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarHora.dart';
import 'package:autoguard/presentation/screens/sacar_turno/SeleccionarMedico.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: WelcomeScreen.name,
      builder: (context, state) => WelcomeScreen(),
      routes: [
        GoRoute(
          name: LoginScreen.name,
          path: 'login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          name: RegistrationScreen.name,
          path: 'register',
          builder: (context, state) => RegistrationScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => ScaffoldWithNavBar(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: HomeScreen.name,
                  path: 'home',
                  builder: (context, state) => HomeScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: AdminScreen.name,
                  path: 'Admin',
                  builder: (context, state) => AdminScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: 'sacarTurno',
                  builder: (context, state) => ConsultarEspecialista(),
                  routes: [
                    GoRoute(
                      path: 'seleccionarEspecialista',
                      builder: (context, state) => SeleccionarMedico()
                    ),
                    GoRoute(
                      path: 'seleccionarFecha',
                      builder: (context, state) => SeleccionarFecha()
                    ),
                    GoRoute(
                      path: 'seleccionarHora',
                      builder:(context, state) => SeleccionarHora(),
                    )
                  ])
              ],
            ),
            StatefulShellBranch(routes: [
              GoRoute(
                path: 'asociarObraSocial',
                builder: (context, state) => AgregarObraSocial(),
              ),
              GoRoute(
                path: 'registrarMedico',
                builder: (context, state) => RegistroMedicoScreen(),
              ),
              GoRoute(
                path: 'misTurnosUser',
                builder: (context, state) => MisTurnosUser(),
              ),
            ])
          ],
        ),
      ],
    ),
  ],
);
