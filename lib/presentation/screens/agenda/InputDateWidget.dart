import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

DateFormat formatFecha = DateFormat("dd-MM-yyyy");

class InputDateWidget extends StatefulWidget {
  @override
  _InputDateWidgetState createState() => _InputDateWidgetState();
}

class _InputDateWidgetState extends State<InputDateWidget> {
  TextEditingController _desdeController = TextEditingController();
  TextEditingController _hastaController = TextEditingController();
  DateTime? _selectedDateFrom;
  DateTime? _selectedDateTo;

  String? get _errorText {
    if (isDateRangeValid(_selectedDateFrom, _selectedDateTo)) {
      return null;
    } else {
      return 'La fecha desde debe ser anterior a la fecha hasta';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: 'Ingresa la fecha desde',
            ),
            controller: _desdeController,
            onTap: () async {
              final DateTime? date = await showDatePicker(
                context: context,
                initialDate: _selectedDateFrom ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );

              if (date != null) {
                _desdeController.text = formatFecha.format(date);
                setState(() {
                  _selectedDateFrom = date;
                });
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: 'Ingresa la fecha hasta',
              errorText: _errorText,
            ),
            controller: _hastaController,
            onTap: () async {
              final DateTime? date = await showDatePicker(
                context: context,
                initialDate: _selectedDateTo ?? DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );

              if (date != null) {
                _hastaController.text = formatFecha.format(date);
                setState(() {
                  _selectedDateTo = date;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

bool isDateRangeValid(DateTime? from, DateTime? to) {
  if (from == null || to == null) {
    return true;
  }
  return from.isBefore(to);
}
