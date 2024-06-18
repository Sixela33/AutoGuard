import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:autoguard/presentation/entities/DataEntities/Medic.dart';
import 'package:go_router/go_router.dart';

final medicosDisponiblesProvider = FutureProvider<List<Medic>>((ref) {
  final turnoState = ref.watch(turnoProvider);
  return ref.read(databaseNotifierProvider).getMedicosOfEspecialidad(turnoState.especialidadSeleccionada);
});

class SeleccionarMedico extends StatelessWidget {
  const SeleccionarMedico({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SeleccionarMedico();
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(medicosDisponiblesProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final turnoNotifier = ref.watch(turnoProvider.notifier);
    final medicosDisponibles = ref.watch(medicosDisponiblesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Médico'),
        backgroundColor: const Color(0xFF8BC34A),
        elevation: 0,
      ),
      body: medicosDisponibles.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (medicos) {
          return ListView.builder(
            itemCount: medicos.length,
            itemBuilder: (context, index) {
              final medico = medicos[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(medico.nombre),
                  subtitle: Text(medico.especialidades.join(', ')),
                  leading: const Icon(Icons.person, color: Color(0xFF8BC34A)),
                  onTap: () {
                    turnoNotifier.setMedicoSeleccionado(medico);
                    context.pushReplacement('/sacarTurno/seleccionarFecha');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
