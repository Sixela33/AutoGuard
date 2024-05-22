import 'package:autoguard/presentation/screens/AgregarNevaObraSocial.dart';
import 'package:autoguard/presentation/screens/AgregarObraSocialUsuario.dart';
import 'package:autoguard/presentation/screens/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/HomeScreen.dart';
import 'package:autoguard/presentation/screens/LoginScreen.dart';
import 'package:autoguard/presentation/screens/RegistrationScreen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen()
    ),
    GoRoute(
      name: AgregarNuevaObraSocial.name,
      path: '/agregarObraSocial',
      builder: (context, state) => AgregarNuevaObraSocial(),
    ),
    GoRoute(
      name: RegistrationScreen.name,
      path: '/register',
      builder: (context, state) => RegistrationScreen(),
    ),
     GoRoute(
      name: LoginScreen.name,
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/especialista',
      builder: (context, state) => ConsultarEspecialista()
    )
  ],
  
);