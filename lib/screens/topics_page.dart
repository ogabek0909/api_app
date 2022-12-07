import 'package:api_app/services/quiz_api.dart';
import 'package:api_app/widgets/topics.dart';
import 'package:flutter/material.dart';
class TopicsPage extends StatelessWidget {
  final int id;
   TopicsPage({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: FutureBuilder(
        future: Services.getTopic(id: id),
        builder: (context, snapshot) {
        print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if(snapshot.hasError){
                return Center(child: Text('Error'),);
              }else{
                return TopicsWidget(topics: snapshot.data['topic']);
              }
      },),
    );
  }
}