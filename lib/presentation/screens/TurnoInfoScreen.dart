import 'package:autoguard/presentation/entities/DataEntities/Turno.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TurnoInfoScreen extends ConsumerWidget {
  final Turno turno;

  const TurnoInfoScreen({Key? key, required this.turno}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);
 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información del Turno"),
      ),
      body: Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Text('Médico: ${turno.medicoName}'),
            const SizedBox(height: 8.0),
            Text('Especialidad: ${turno.especialidadSeleccionada}'),
            const SizedBox(height: 8.0),
            Text('Fecha y Hora: ${turno.fechaHora.toString()}'),
            const SizedBox(height: 8.0),
            Text('Razón de la Consulta: ${turno.razonConsulta}'),
            const SizedBox(height: 8.0),
            Text('Estado: ${turno.estado.toString().split('.').last}'),
            const SizedBox(height: 8.0),
            FilledButton(onPressed: () {
              databaseNotifier.cancelarTurno(turno.id);
              context.push('/home');
            }, child: Text("cancelar turno"))
          ],
        ),
      ),
    ),
    );
  }
}
