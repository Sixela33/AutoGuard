import 'package:autoguard/core/repository/TurnoRepository.dart';
import 'package:autoguard/presentation/providers/utilProviders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SacarTurno extends ConsumerWidget {

TextEditingController _fechaController = TextEditingController();
  
  @override
  Widget build(BuildContext context, ref) {

    var diasDisponibles = ref.watch(getDiasDisponiblesProvider);
    final dateFormat = ref.read(dateFormatProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sacar Turno',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8BC34A),
        elevation: 0,
      ),
      body: diasDisponibles.when(data: 
      (data) {
        data.sort();
        showDatePicker(context: context, firstDate: dateFormat.parse(data.first) , lastDate: dateFormat.parse(data.last), initialDate: dateFormat.parse(data.first),
            selectableDayPredicate: (day) {
              return data.contains(dateFormat.format(day));
            });
        return Container();
          },
      error: (error, stack) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator())),
    );

  }
}