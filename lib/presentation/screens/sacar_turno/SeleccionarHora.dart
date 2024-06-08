import 'package:autoguard/presentation/entities/ThemeProvider.dart';
import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SeleccionarHora extends ConsumerStatefulWidget {
  const SeleccionarHora({Key? key}) : super(key: key);

  @override
  _SeleccionarHoraState createState() => _SeleccionarHoraState();
}

class _SeleccionarHoraState extends ConsumerState<SeleccionarHora> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final turnoNotifier = ref.watch(turnoProvider.notifier);
    final duracionTurno = turnoNotifier.state.medicoSeleccionado.duracionTurno;
    final themeProvider = ref.watch(themeNotifier);

    final int totalSlots = (24 * 60) ~/ duracionTurno;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Hora'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Seleccionar Hora',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: totalSlots,
              itemBuilder: (context, index) {
                final int minutes = index * duracionTurno;
                final int hour = minutes ~/ 60;
                final int minute = minutes % 60;
                final bool isSelected = _selectedTime.hour == hour && _selectedTime.minute == minute;
                final String timeLabel = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

                return TimeSlot(
                  timeLabel: timeLabel,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      _selectedTime = TimeOfDay(hour: hour, minute: minute);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                turnoNotifier.setTime(_selectedTime);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Turno reservado con éxito')),
                );
                context.push('/home');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeSlot extends ConsumerWidget {
  final String timeLabel;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlot({
    required this.timeLabel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, ref) {
    final themeProvider = ref.watch(themeNotifier);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? themeProvider.primaryColorLight : themeProvider.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          timeLabel,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
