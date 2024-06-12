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
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BotonMenu(texto: 'Nueva Consulta', ruta: '/sacarTurno'),
            BotonMenu(texto: 'Tus Consultas', ruta: '/consultas'),
            BotonMenu(texto: 'Perfil', ruta: '/perfil'),
          ],
        ),
      ),
    );
  }
}

class BotonMenu extends StatelessWidget {
  final String texto;
  final String ruta;

  const BotonMenu({required this.texto, required this.ruta, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            context.push(ruta);
          },
          child: Text(texto),
        ),
      ),
    );
  }
}
