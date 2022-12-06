import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int? _groupValue;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is question place'),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return RadioListTile(
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
            )
          ],
        ),
      ),
    );
  }
}
