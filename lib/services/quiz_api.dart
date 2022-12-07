import 'dart:convert';
import 'package:http/http.dart' as http;

String baseUrl = 'http://192.168.0.66:8000/';

Future getQuiz() async {
  Uri url = Uri.parse('${baseUrl}quiz_list/');
  http.Response response = await http.get(url);
  print(response.statusCode);
  List data = jsonDecode(response.body);
  print(data);

  return data;
}

class Services {
  static Future getTopic({id}) async {
    http.Response response =
        await http.get(Uri.parse('${baseUrl}topic_list/$id/'));
    Map dataFromJson = jsonDecode(response.body);
    print(dataFromJson.runtimeType);
    return dataFromJson;
  }
}

// List<Map> getQuiz() {
//   return [
//     {
//       "question": "question 01",
//       "id": 1,
//       "options": [
//         {"id": 1, "title": "option 01"},
//         {"id": 2, "title": "option 02"}
//       ]
//     },
//     {
//       "question": "question 02",
//       "id": 2,
//       "options": [
//         {"id": 3, "title": "option 001"},
//         {"id": 4, "title": "option 02"}
//       ]
//     },
//     {
//       "question": "question 03",
//       "id": 3,
//       "options": [
//         {"id": 5, "title": "option 01"},
//         {"id": 6, "title": "option 002"}
//       ]
//     }
//   ];
// }
