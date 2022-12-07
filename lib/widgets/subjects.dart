import 'package:api_app/screens/topics_page.dart';
import 'package:api_app/services/quiz_api.dart';
import 'package:flutter/material.dart';

class Subjects extends StatelessWidget {
  final List subjects;
  Subjects({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          child: ListTile(
            title: Text(subjects[index]['title']),
          ),
          onPressed: () {
            print(subjects[index]['id']);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicsPage(id: subjects[index]['id'],),
              ),
            );
          },
        );
      },
    );
  }
}
