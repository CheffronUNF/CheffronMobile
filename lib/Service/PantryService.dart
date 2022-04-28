import 'dart:convert';
import 'package:cheffron_mobile/CheffronConfig.dart';
import 'package:http/http.dart' as http;
import '../Model/Pantry.dart';
import '../main.dart';

var _url = cheffronURL.resolve("/pantry");

Future<Pantry> getPantry() async
{
  throw Error();
}

Future<String> updatePantry(String id, Pantry pantry) async
{
  throw Error();
}