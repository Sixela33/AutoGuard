import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
    static String name = 'Welcome';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _WelcomeScreen();
  }
}

class _WelcomeScreen extends StatelessWidget {
  const _WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilledButton(
        child: Text("Continue"),
        onPressed: () {
          context.push('/home');
        },),
    );
  }
}