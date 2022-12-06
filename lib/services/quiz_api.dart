import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getQuiz() async {
  Uri url = Uri.parse('https://2144-84-54-76-144.eu.ngrok.io/api/quiz/1/');
  http.Response response = await http.get(url);

  List data = jsonDecode(response.body);
  print(data);

  return data;
}
