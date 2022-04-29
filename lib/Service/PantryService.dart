import 'dart:convert';
import 'package:cheffron_mobile/CheffronConfig.dart';
import 'package:http/http.dart' as http;
import '../Model/Pantry.dart';
import '../main.dart';

var _url = cheffronURL.resolve("/pantry");

Future<Pantry?> getPantry() async
{
  String jwt;

  try {
    jwt = await preferences.read("jwt");
  }
  catch (ex) {
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

Future<String> updatePantry(String id, Pantry pantry) async
{
  throw Error();
}