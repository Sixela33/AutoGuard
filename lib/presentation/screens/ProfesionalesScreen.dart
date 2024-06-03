import 'package:autoguard/core/User/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfesionalesScreen extends StatelessWidget {
  final String especialidad;
  const ProfesionalesScreen({super.key, required this.especialidad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profesionales',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
          future: getMedicosEspecialidad(especialidad),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final medicos = snapshot.data;
              return ListView.builder(
                  itemCount: medicos!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(medicos[index].nombre),
                      subtitle: Text(medicos[index].especialidad ?? "Clínico"),
                      onTap: () {
                        context.push('/turnos', extra: medicos[index].id);
                      },
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
