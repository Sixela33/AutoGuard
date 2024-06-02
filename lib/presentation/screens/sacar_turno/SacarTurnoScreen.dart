import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:autoguard/presentation/screens/sacar_turno/ConsultarEspecialista.dart';
import 'package:autoguard/presentation/screens/sacar_turno/StepperSteps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SacarTurnoScreen extends StatelessWidget {
  const SacarTurnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SacarTurnoScreen();
  }
}

class _SacarTurnoScreen extends ConsumerStatefulWidget {
  const _SacarTurnoScreen({
    super.key,
  });

  @override
  _SacarTurnoScreenState createState() => _SacarTurnoScreenState();
}

class _SacarTurnoScreenState extends ConsumerState<_SacarTurnoScreen> {

  @override
  Widget build(BuildContext context) {
    final turnoNotifierController = ref.read(turnoProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sacar Turno"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(turnoNotifierController.getCurrentStep()),
        currentStep: turnoNotifierController.getCurrentStep(),
        controlsBuilder: (context, details) {
          return SizedBox();
        },
      ),
    );
  }
}





