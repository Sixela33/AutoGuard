import 'package:autoguard/core/repository/TurnoRepository.dart';
import 'package:autoguard/presentation/entities/DataEntities/EstadoTurno.dart';
import 'package:autoguard/presentation/entities/DataEntities/Turno.dart';
import 'package:autoguard/presentation/providers/utilProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TurnoMedico extends ConsumerWidget {
  final Turno turno;

  TurnoMedico({required this.turno});

  @override
  Widget build(BuildContext context, ref) {
    final detalleTurno = ref.watch(detalleTurnoProvider(turno));

    return detalleTurno.when(
      data: (data) => DetalleTurnoScreen(detalleTurno: data),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}

class DetalleTurnoScreen extends ConsumerWidget {
  final DetalleTurno detalleTurno;
  DetalleTurnoScreen({required this.detalleTurno});

  @override
  Widget build(BuildContext context, ref) {
    final dateFormat = ref.read(dateFormatProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Turnos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8BC34A),
        elevation: 0,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Paciente: ${detalleTurno.emailPaciente}'),
            subtitle:
                Text('Fecha: ${dateFormat.format(detalleTurno.fechaHora)}'),
          ),
          ListTile(
            title: Text('Razon de consulta: ${detalleTurno.razonConsulta}'),
          ),
          ListTile(
            title:
                Text('Especialidad: ${detalleTurno.especialidadSeleccionada}'),
          ),
          ListTile(
            title: Text('Estado: ${detalleTurno.estado.name}'),
          ),
          if (detalleTurno.diagnostico != null)
          ListTile(
            title: Text('Diagnostico: ${detalleTurno.diagnostico}'),
          ),
          if (detalleTurno.tratamiento != null)
          ListTile(
            title: Text('Tratamiento: ${detalleTurno.tratamiento}'),
          ),
        ],
      ),
      floatingActionButton: detalleTurno.estado == EstadoTurno.pendiente ? FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => FinalizarTurnoDialog(turnoId: detalleTurno.id),
          
          );
        },
        child: Icon(Icons.edit),
      ) : null,
    );
  }
}

class FinalizarTurnoDialog extends ConsumerWidget {
  final String turnoId;
  FinalizarTurnoDialog({required this.turnoId});

  TextEditingController diagnosticoController = TextEditingController();
  TextEditingController tratamientoController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
  insetPadding: EdgeInsets.all(10),
      child: 
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          height: 450,
          alignment: Alignment.center,
          child: Column(
            children: [
              TextField(
          decoration: InputDecoration(labelText: 'Diagnostico', border: OutlineInputBorder()),
          maxLines: 5,
          controller: diagnosticoController,
              ),
              SizedBox(height: 20,),
              TextField(
          decoration: InputDecoration(labelText: 'Tratamiento', border: OutlineInputBorder()),
          maxLines: 5,
          controller: tratamientoController,
              ),
              Wrap(
          children: [
            TextButton(
              onPressed: () {
                ref
              .read(turnoRepositoryProvider)
              .finalizarTurno(turnoId, diagnosticoController.text, tratamientoController.text);
                Navigator.of(context).pop();
              },
              child: Text('Finalizar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
              )
            ],
          ),
        ),
    );
  }
}
