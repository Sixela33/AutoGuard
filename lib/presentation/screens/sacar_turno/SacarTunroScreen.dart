import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:autoguard/presentation/screens/sacar_turno/StepperSteps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SacarTunroScreen extends StatelessWidget {
  const SacarTunroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SacarTunroScreen();
  }
}

class _SacarTunroScreen extends ConsumerStatefulWidget {
  const _SacarTunroScreen({
    super.key,
  });

  @override
  _SacarTunroScreenState createState() => _SacarTunroScreenState();
}

class _SacarTunroScreenState extends ConsumerState<_SacarTunroScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final turnoNotifier = ref.watch(turnoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("sacar turno")),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          setState(() {
            if (currentStep == getSteps().length -1) {
              print('completado');
            }
            currentStep +=1;
          });
        },
        onStepCancel: () {
          setState(() {
            currentStep == 0 ? null : currentStep -=1;
          });
        },
      ),
    );
  }
}