import 'dart:convert';
import 'package:cheffron_mobile/CheffronConfig.dart';
import 'package:http/http.dart' as http;
import '../Model/User.dart';
import '../main.dart';

var _url = cheffronURL.resolve("/user");

//create Account
Future<String> createUser(User user) async {
  final response = await http.post(_url, body: user.toJson());

  switch (response.statusCode)
  {
    case 200:
      return "success";
    case 406:
      return "malformed";
    default:
      return "fail";
  }
}

Future<User?> getUser(String id) async {
  final response = await http.get(_url.resolve('/$id'));

  switch (response.statusCode)
  {
    case 200:
      return User.fromJson(jsonDecode(response.body));
    default:
      return null;
  }
}

Future<String> updateUser(String id, User user) async {
  String jwt;

  try {
    jwt = preferences.read("jwt");
  }
  catch (ex) {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.patch(_url.resolve('/$id'), headers: headers, body: user.toJson());

  switch (response.statusCode)
  {
    case 201:
      return "success";
    default:
      return "fail";
  }
}

Future<String> deleteUser(String id) async {
  String jwt;

  try {
    jwt = preferences.read("jwt");
  }
  catch (ex) {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.patch(_url.resolve('/$id'), headers: headers);

  switch (response.statusCode)
  {
    case 201:
      return "success";
    default:
      return "fail";
  }
}
