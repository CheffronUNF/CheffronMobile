import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

Future<String> createAuth(String username, String firstName, String lastName, String email, String password) async {
  final response = await http.get(
    Uri.parse('https://elian.tk:8808/auth'),
      headers: {
        'Authorization': username + password;
      },



  );

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