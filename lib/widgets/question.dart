import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final List questions;
  const QuizWidget({super.key, required this.questions});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? _groupValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.questions
          .map(
            (questionMap) => Expanded(
              child: Column(
                children: [
                  Text(questionMap['question']),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questionMap['optons'].length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(questionMap['optons'][index]['option']),
                          value: index,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            setState(() {
                              _groupValue = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
