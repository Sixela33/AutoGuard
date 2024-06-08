import 'package:flutter/material.dart';

class InputTimeWidget extends StatefulWidget {
  @override
  _InputTimeWidgetState createState() => _InputTimeWidgetState();
}

class _InputTimeWidgetState extends State<InputTimeWidget> {
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;
  int? _interval;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: DropdownButton(
            hint: Text('Selecciona el intervalo entre turnos'),
            value: _interval,
            items: List.of([
              DropdownMenuItem(
                child: Text('15 minutos'),
                value: 15,
              ),
              DropdownMenuItem(
                child: Text('30 minutos'),
                value: 30,
              ),
              DropdownMenuItem(
                child: Text('1 hora'),
                value: 60,
              ),
            ]),
            onChanged: (value) {
              setState(() {
                _interval = value as int?;
              });
            },
          ),
        ),
        Container(
          mainAxisAlignment: MainAxisAlignment.center,
          child: DropdownButton(
            items: List.generate(getLength(_interval!), (index) {
              return DropdownMenuItem(
                child: Text('$_fromTime - $_toTime'),
                value: index,
              );
            }),
          ),
        )
      ],
    );
  }
}

int getLength(int interval) {
  return 60 / interval * 24 as int;
}