import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

var _url = Uri.parse('https://elian.tk:8808/auth');

Future<String> login(String username, String password) async
{
  var encoded = base64.encode(utf8.encode(username + ":" + password));
  var headers = { 'Authorization': "Basic " + encoded };

  final response = await http.get(_url, headers: headers);

  switch (response.statusCode)
  {
    case 200:
      var body = jsonDecode(response.body);
      String jwt = body["jwt"];
      preferences.save("jwt", jwt);
      return "success";
    case 406:
      return "malformed";
    default:
      return "fail";
  }
}

Future<String> changePassword(String password)
{
  throw Error();
}