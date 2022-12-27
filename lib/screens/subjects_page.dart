import 'package:api_app/services/quiz_api.dart';
import 'package:api_app/widgets/subjects.dart';
import 'package:api_app/widgets/question.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int? _groupValue;
int inx = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // void _nextQuestionFunction() {
    //   // if (inx == getQuiz().length - 1) {
    //   //   return;
    //   // }
    //   setState(() {
    //     inx++;
    //     _groupValue = null;
    //   });
    // }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Application'),
        ),
        body: FutureBuilder(
          future: Services.getQuiz(),
          builder: (context,AsyncSnapshot snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if(snapshot.hasError){
              return const Center(child: Text('Error'),);
            }else{
              return Subjects(subjects: snapshot.data);
            }
          },
        ));
  }
}
/* Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getQuiz()[inx]['question'].toString()),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => RadioListTile(
                  title: Text(getQuiz()[inx]['options'][index]['title']),
                  value: index,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      _groupValue = value;
                    });
                  },
                ),
                itemCount: getQuiz()[inx]['options'].length,
              ),
            ),
            ElevatedButton(onPressed: _nextQuestionFunction, child: Text('add'))
          ],
        ),
      ),
      */