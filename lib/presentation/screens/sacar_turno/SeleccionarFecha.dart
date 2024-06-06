import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

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
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(2020, 1, 1);
  DateTime _lastDay = DateTime.utc(2030, 1, 1);

  @override
  Widget build(BuildContext context) {
    final turnoNotifier = ref.watch(turnoProvider.notifier);
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Seleccionar Fecha'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: _firstDay,
                lastDay: _lastDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  turnoNotifier.setFechaSeleccionada(_selectedDay);
                  context.push('/sacarTurno/seleccionarHora'); 
                },
                child: Text('Seleccionar Fecha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
