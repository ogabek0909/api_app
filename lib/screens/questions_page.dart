import 'package:api_app/services/quiz_api.dart';
import 'package:api_app/widgets/question.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final int id;
  final String topicName;

  const QuestionPage({super.key, required this.topicName, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topicName),
      ),
      body: FutureBuilder(
        future: Services.getQuestion(id: id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return QuizWidget(questions: snapshot.data['topic']['questions']);
          }
        },
      ),
    );
  }
}
