import 'dart:convert';
import 'package:cheffron_mobile/CheffronConfig.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

var _url = cheffronURL.resolve("/auth");

Future<String> login(String username, String password) async
{
  var encoded = base64.encode(utf8.encode(username + ":" + password));
  var headers = { 'Authorization': "Basic " + encoded };

  final response = await http.get(_url, headers: headers);

  switch (response.statusCode)
  {
    case 200:
      preferences.save("jwt", response.headers["jwt"]!);
      return "success";
    case 406:
      return "malformed";
    default:
      return "fail";
  }
}

Future<String> changePassword(String password) async
{
  throw Error();
}