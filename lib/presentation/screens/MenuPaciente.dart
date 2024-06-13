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

class BotonMenu extends StatelessWidget {
  final String texto;
  final String ruta;
  final IconData icono;

  const BotonMenu({required this.texto, required this.ruta, required this.icono, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icono, color: Color(0xFF8BC34A), size: 40),
        title: Text(
          texto,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          context.push(ruta);
        },
      ),
    );
  }
}
