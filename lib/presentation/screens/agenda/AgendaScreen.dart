import 'package:autoguard/presentation/screens/agenda/DaysOfWeekWidget.dart';
import 'package:autoguard/presentation/screens/agenda/InputDateWidget.dart';
import 'package:autoguard/presentation/screens/agenda/InputTimeWidget.dart';
import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: PageView(
        children: [
          InputDateWidget(),
          DaysOfWeekWidget(),
          InputTimeWidget(),
        ],
      ),
    );
  }
}
