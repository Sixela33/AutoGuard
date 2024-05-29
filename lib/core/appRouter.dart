import 'package:autoguard/presentation/components/ScaffoldWithNavbar.dart';
import 'package:autoguard/presentation/screens/AdminScreen.dart';
import 'package:autoguard/presentation/screens/AgregarObraSocialUsuario.dart';
import 'package:autoguard/presentation/screens/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/HomeScreen.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';
import 'package:autoguard/presentation/screens/RegistrationScreen.dart';
import 'package:autoguard/presentation/screens/WelcomeScreen.dart';
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
                  path: 'especialista',
                  builder: (context, state) => ConsultarEspecialista(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'asociarObraSocial',
          builder: (context, state) => AgregarObraSocial(),
        ),
      ],
    ),
  ],
);
