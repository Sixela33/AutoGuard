import 'package:autoguard/core/Agenda/AgendaRepository.dart';
import 'package:autoguard/core/Turnos/TurnoRepository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TurnosScreen extends StatelessWidget {

  final String idMedico;

  TurnosScreen({super.key, required this.idMedico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turnos'),
      ),
      body: FutureBuilder(
        future: getCitasLibresMedico(idMedico),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final citas = snapshot.data;
            return ListView.builder(
                itemCount: citas!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(citas[index].getFecha()),
                      subtitle: Text(citas[index].getHora()),
                      onTap: () {
                        registrarTurno(citas[index]);
                        context.go("/");
                      },
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}