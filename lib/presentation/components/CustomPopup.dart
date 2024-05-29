import 'package:flutter/material.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  const CustomPopup({
    Key? key,
    required this.title,
    required this.content,
    this.buttonText = 'OK',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
