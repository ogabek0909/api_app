import 'package:flutter/material.dart';
class TopicsWidget extends StatelessWidget {
  final List topics;
   TopicsWidget({super.key,required this.topics});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(topics[index]['t_name']),
        );
      },
    );
  }
}