import 'package:autoguard/presentation/providers/turnoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SeleccionarHora extends ConsumerStatefulWidget {
  SeleccionarHora({
    Key? key,
  }) : super(key: key);

  @override
  _SeleccionarHoraState createState() => _SeleccionarHoraState();
}

class _SeleccionarHoraState extends ConsumerState<SeleccionarHora> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final turnoNotifier = ref.watch(turnoProvider.notifier);
    final duracionTurno = turnoNotifier.state.medicoSeleccionado.duracionTurno;

    // Calculate the total number of time slots in a day based on the duration
    final int totalSlots = (24 * 60) ~/ duracionTurno;

    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Hora'),
      ),
      body: Column(
        children: [
          Text(
            'Seleccionar Hora',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of columns
                childAspectRatio: 2, // Adjust this value to change the aspect ratio
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: totalSlots,
              itemBuilder: (context, index) {
                final int minutes = index * duracionTurno;
                final int hour = minutes ~/ 60;
                final int minute = minutes % 60;
                final isSelected = _selectedTime.hour == hour && _selectedTime.minute == minute;
                final timeLabel = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = TimeOfDay(hour: hour, minute: minute);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      timeLabel,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                turnoNotifier.setTime(_selectedTime);
                print('Selected Time: ${_selectedTime.format(context)}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Turno reservado con exito')),
                );
                context.push('/home');
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
