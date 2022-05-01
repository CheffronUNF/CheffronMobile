import 'dart:convert';
import 'package:cheffron_mobile/CheffronConfig.dart';
import 'package:http/http.dart' as http;
import '../Model/Pantry.dart';
import '../main.dart';

var _url = cheffronURL.resolve("/pantry");

Future<Pantry?> getPantry() async {
  var jwt = await preferences.jwt();

  if (jwt == null)
  {
    return null;
  }

  var headers = {"jwt":jwt};
  final response = await http.get(_url, headers: headers);

  switch (response.statusCode)
  {
    case 200:
      return Pantry.fromJson(jsonDecode(response.body));
    default:
      return null;
  }
}

Future<String> updatePantry(Pantry pantry) async {
  var jwt = await preferences.jwt();

  if (jwt == null)
  {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.patch(_url, headers: headers, body: jsonEncode(pantry.toJson()));

  switch (response.statusCode)
  {
    case 201:
      return "success";
    default:
      return "fail";
  }
}