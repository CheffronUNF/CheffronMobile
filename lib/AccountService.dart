import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Model/User.dart';
import 'main.dart';

//create Account
Future<String> createAccount(User user) async {
  final response = await http.post(
    Uri.parse('https://elian.tk:8808/user'),
    body: user.toJson(),
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

