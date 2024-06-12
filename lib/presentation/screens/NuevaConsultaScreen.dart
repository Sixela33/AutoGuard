import 'package:flutter/material.dart';

class NuevaConsultaScreen extends StatefulWidget {
  @override
  _NuevaConsultaScreenState createState() => _NuevaConsultaScreenState();
}

class _NuevaConsultaScreenState extends State<NuevaConsultaScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Consulta'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep += 1;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            }
          });
        },
        steps: [
          Step(
            title: Text('Step 1'),
            content: Container(
              child: Text('Step 1 Content'),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('Step 2'),
            content: Container(
              child: Text('Step 2 Content'),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('Step 3'),
            content: Container(
              child: Text('Step 3 Content'),
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}