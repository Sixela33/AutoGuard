import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SeleccionarFecha extends StatelessWidget {
    // https://pub.dev/packages/table_calendar

  const SeleccionarFecha({super.key});

  @override
  Widget build(BuildContext context) {
    return _SeleccionarFecha();
  }
}

class _SeleccionarFecha extends ConsumerStatefulWidget {
  const _SeleccionarFecha({
    super.key,
  });

  @override
  _SeleccionarFechaState createState() => _SeleccionarFechaState();
}

class _SeleccionarFechaState extends ConsumerState<_SeleccionarFecha> {
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
                    child: const Text('Ver especialistas'),
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