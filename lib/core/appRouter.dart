import 'package:autoguard/presentation/screens/AgregarNevaObraSocial.dart';
import 'package:autoguard/presentation/screens/HomeScreen.dart';
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
      name: AgregarObraSocial.name,
      path: '/agregarObraSocial',
      builder: (context, state) => AgregarObraSocial(),
    ),
  ]
);