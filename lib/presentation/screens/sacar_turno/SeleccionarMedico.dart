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
    final turnoNotifier = ref.watch(turnoProvider.notifier);
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    child: const Text('Continuar'),
                    onPressed: () async {
                      turnoNotifier.nextStep();
                      context.pushReplacement('/sacarTurno');
                    },
                  ),
                  TextButton(onPressed: () {
                      turnoNotifier.lastStep();
                      context.pushReplacement('/sacarTurno');
                  }, child: Text("Cancelar"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}