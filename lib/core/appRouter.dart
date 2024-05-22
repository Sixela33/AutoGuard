import 'package:autoguard/presentation/components/ScaffoldWithNavbar.dart';
import 'package:autoguard/presentation/screens/AgregarNevaObraSocial.dart';
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
        StatefulShellRoute.indexedStack(
          builder: ((context, state, navigationShell) => ScaffoldWithNavBar(navigationShell: navigationShell)),
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
            StatefulShellBranch(routes: [
              GoRoute(
                name: AgregarNuevaObraSocial.name,
                path: 'Admin',
                builder: (context, state) => AgregarNuevaObraSocial(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: 'especialista',
                builder: (context, state) => ConsultarEspecialista()
              )
            ])
          ]    
        ),
      
        GoRoute(
          name: RegistrationScreen.name,
          path: 'register',
          builder: (context, state) => RegistrationScreen(),
        ),
        
      ]
    )
    
  ],
  
  
);