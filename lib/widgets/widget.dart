import 'package:flutter/material.dart';

import '../services/quiz_api.dart';

class QuizOptions extends StatefulWidget {
  final String quiz;
  final int index;
  QuizOptions({super.key, required this.quiz, required this.index});

  @override
  State<QuizOptions> createState() => _QuizOptionsState();
}

int? _groupValue;

class _QuizOptionsState extends State<QuizOptions> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(widget.quiz),
      value: widget.index,
      groupValue: _groupValue,
      onChanged: (value) {
        setState(() {
          print(value);
          _groupValue = value;
        });
      },
    );
  }
}
