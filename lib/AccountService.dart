import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

//create Account
Future<String> createAccount(String username, String firstName, String lastName, String email, String password) async {
  final response = await http.post(
    Uri.parse('https://elian.tk:8808/user'),
    body: jsonEncode(<String, String>{
      "username": username, "first name": firstName, "last name": lastName, "email": email,
      "password": password
    }),
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

