import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

//create Account
Future<String> createAccount(String username, String firstName, String lastName, String email, String password) async {
  final bytes = utf8.encode(password);
  final base64Str = base64.encode(bytes);
  final response = await http.post(
    Uri.parse('https://elian.tk:8808/user'),
    body: jsonEncode(<String, String>{
      "username": username, "first name": firstName, "last name": lastName, "email": email,
      "password": base64Str
    }),
  );

  if (response.statusCode == 200) {
    String jwt = response.headers["jwt"]!;
    preferences.save("jwt", jwt);
    return "success";
  } else {
    dynamic jsonDecoded = jsonDecode(response.body);
    String error = jsonDecoded["error"];
    if (error == "Username already exists"){
      return "user";
    }
    else if (error == "Email already exists"){
      return "email";
    }
  }
  return "";
}

