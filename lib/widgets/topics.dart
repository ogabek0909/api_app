import 'package:api_app/screens/questions_page.dart';
import 'package:flutter/material.dart';

class TopicsWidget extends StatelessWidget {
  final Map topics;
  const TopicsWidget({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: topics['quiz']['topics'].length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionPage(
                    topicName: topics['quiz']['topics'][index]['t_name'],
                    id: topics['quiz']['topics'][index]['id'],
                  ),
                ),
              );
            },
            child: Text(
              topics['quiz']['topics'][index]['t_name'].toString(),
            ),
          ),
        );
      },
    );
  }
}
