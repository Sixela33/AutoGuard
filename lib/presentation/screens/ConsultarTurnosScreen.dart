import 'package:autoguard/core/Turnos/TurnoRepository.dart';
import 'package:flutter/material.dart';

class ConsultarTurnosScreen extends StatelessWidget {
  ConsultarTurnosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Turnos'),
        ),
        body: FutureBuilder(
          future: getTurnos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final turnos = snapshot.data;
              return ListView.builder(
                itemCount: turnos!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(turnos[index].fecha),
                      subtitle: Text(turnos[index].medico),
                      onTap: () {},
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
