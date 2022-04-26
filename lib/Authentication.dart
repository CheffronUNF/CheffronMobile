import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

//Hailey F 4/26/22 -- Feel free to change, still learning
Future<String> createAuth(String username, String password) async {

  final response = await http.get(
    Uri.parse('https://elian.tk:8808/auth'),
      headers: {
        'Authorization': base64.encode(utf8.encode(username + password));
      },
  );

  String jwt = response.body;

  switch (response.statusCode)
  {
    case 200:
      return "success";
    case 401:
      return "fail";
    default:
      return "malformed";
  }


}