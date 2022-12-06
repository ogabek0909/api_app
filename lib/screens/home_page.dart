import 'package:api_app/services/quiz_api.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is question place'),
            FutureBuilder(
              future: getQuiz(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, indx) {
                        return Column(
                          children: [
                            Text(snapshot.data![indx]['question']),
                            Expanded(
                                child: ListView.builder(
                              itemBuilder: (context, index) => RadioListTile(
                                title: snapshot.hasData
                                    ? (snapshot.data![indx]['options'][indx]
                                        ['title'])
                                    : Text('null'),
                                value: index,
                                groupValue: _groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    _groupValue = value;
                                  });
                                },
                              ),
                              itemCount: 2,
                            ))
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }
                return const Text('Question');
              },
            ),
          ],
        ),
      ),
    );
  }
}
