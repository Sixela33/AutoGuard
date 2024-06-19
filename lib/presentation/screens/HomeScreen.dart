import 'package:autoguard/presentation/components/BotonMenu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuPaciente extends StatelessWidget {
  const MenuPaciente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu Paciente',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF8BC34A),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BotonMenu(
                texto: 'Nueva Consulta',
                ruta: '/sacarTurno',
                icono: Icons.medical_services,
              ),
              BotonMenu(
                texto: 'Tus Consultas',
                ruta: '/consultas',
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
