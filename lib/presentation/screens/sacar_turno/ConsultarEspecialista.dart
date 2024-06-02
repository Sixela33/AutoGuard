import 'package:autoguard/presentation/components/functions/consultarEspecialista.dart';
import 'package:autoguard/presentation/providers/dbProvider.dart';
import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConsultarEspecialista extends StatelessWidget {
  const ConsultarEspecialista({super.key});

  @override
  Widget build(BuildContext context) {
    return _ConsultarEspecialista();
  }
}

class _ConsultarEspecialista extends ConsumerWidget {
  _ConsultarEspecialista({
    super.key,
  });

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final databaseNotifier = ref.watch(databaseNotifierProvider);
    final turnoNotifierController = ref.read(turnoProvider.notifier);

    databaseNotifier.getEspecialidades();

    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 2,
        ),
      child: Scaffold(
            body: Center(
            child: Column(
            children: [
              Text('Cual es la razón de su consulta?'),
              TextField(
                  controller: _controller,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cual es la razón de su consulta',
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      child: const Text('Ver especialistas'),
                      onPressed: () async {
                        final inputUsuario = _controller.text;
                        await consultarEspecialista(inputUsuario, databaseNotifier.especialidadesMedicas, turnoNotifierController);
                        turnoNotifierController.nextStep();
                        context.pushReplacement('/sacarTurno');
                      },
                    ),
                    TextButton(onPressed: () {
                      context.pop();
                    }, child: Text("Cancelar"))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
