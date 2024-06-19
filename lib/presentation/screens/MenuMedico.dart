import 'package:autoguard/presentation/components/BotonMenu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuMedico extends StatelessWidget {
  const MenuMedico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Médico',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8BC34A),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BotonMenu(
                texto: 'Agenda',
                ruta: '/sacarTurno',
                icono: Icons.medical_services,
              ),
              BotonMenu(
                texto: 'Tus Consultas',
                ruta: '/turnos',
                icono: Icons.calendar_today,
              ),
              BotonMenu(
                texto: 'Perfil',
                ruta: '/perfil',
                icono: Icons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
