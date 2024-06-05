import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class SeleccionarFecha extends StatelessWidget {
  const SeleccionarFecha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SeleccionarFecha();
  }
}

class _SeleccionarFecha extends ConsumerStatefulWidget {
  const _SeleccionarFecha({Key? key}) : super(key: key);

  @override
  _SeleccionarFechaState createState() => _SeleccionarFechaState();
}

class _SeleccionarFechaState extends ConsumerState<_SeleccionarFecha> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(2020, 1, 1);
  DateTime _lastDay = DateTime.utc(2030, 1, 1);
  TimeOfDay _selectedTime = TimeOfDay.now();

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
              ListTile(
                title: Text('Seleccionar Hora'),
                trailing: Text(
                  '${_selectedTime.hour}:${_selectedTime.minute}',
                ),
                onTap: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedTime = pickedTime;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final selectedDateTime = DateTime(
                    _selectedDay.year,
                    _selectedDay.month,
                    _selectedDay.day,
                    _selectedTime.hour,
                    _selectedTime.minute,
                  );
                  turnoNotifier.setFechaSeleccionada(selectedDateTime);
                  context.go('/confirmacion');
                },
                child: Text('Seleccionar Fecha y Hora'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
