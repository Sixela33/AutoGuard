import 'package:autoguard/presentation/entities/DataEntities/Turno.dart';
import 'package:flutter/material.dart';

class TurnoInfoScreen extends StatelessWidget {
  final Turno turno;

  const TurnoInfoScreen({Key? key, required this.turno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información del Turno',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
