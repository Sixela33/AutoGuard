import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SeleccionarMedico extends StatelessWidget {
  const SeleccionarMedico({super.key});

  @override
  Widget build(BuildContext context) {
    return _SeleccionarMedico();
  }
}

class _SeleccionarMedico extends ConsumerStatefulWidget {
  const _SeleccionarMedico({
    super.key,
  });

  @override
  _SeleccionarMedicoState createState() => _SeleccionarMedicoState();
}

class _SeleccionarMedicoState extends ConsumerState<_SeleccionarMedico> {
  @override
  Widget build(BuildContext context) {
    final turnoState = ref.watch(turnoProvider);
    final turnoNotifier = ref.watch(turnoProvider.notifier);

    // Fetch médicos disponibles si no se han cargado aún
    if (turnoState.medicosDisponibles == null || turnoState.medicosDisponibles.isEmpty) {
      turnoNotifier.getMedicosOfEspecialidad();
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: turnoState.medicosDisponibles.length,
                  itemBuilder: (context, index) {
                    final medico = turnoState.medicosDisponibles[index];
                    return ListTile(
                      title: Text(medico.nombre),
                      subtitle: Text(medico.especialidades.join(', ')),
                      onTap: () {
                        turnoNotifier.setMedicoSeleccionado(medico);
                        context.pushReplacement('/sacarTurno/seleccionarFecha');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
