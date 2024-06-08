import 'package:flutter/material.dart';

class DaysOfWeekWidget extends StatefulWidget {
  @override
  _DaysOfWeekWidgetState createState() => _DaysOfWeekWidgetState();
}

class _DaysOfWeekWidgetState extends State<DaysOfWeekWidget> {
  List<bool> _selectedDays = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 7; i++)
          CheckboxListTile(
            title: Text(_getDayOfWeekName(i)),
            value: _selectedDays[i],
            onChanged: (value) {
              setState(() {
                _selectedDays[i] = value!;
              });
            },
          ),
      ],
    );
  }

  String _getDayOfWeekName(int index) {
    switch (index) {
      case 0:
      return 'Lunes';
      case 1:
      return 'Martes';
      case 2:
      return 'Miércoles';
      case 3:
      return 'Jueves';
      case 4:
      return 'Viernes';
      case 5:
      return 'Sábado';
      case 6:
      return 'Domingo';
      default:
      return '';
    }
    }
}