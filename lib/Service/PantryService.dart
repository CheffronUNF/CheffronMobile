import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Pantry.dart';
import '../main.dart';

var _url = Uri.parse('https://elian.tk:8808/pantry');

Future<Pantry> getPantry()
{
  throw Error();
}

Future<String> updatePantry(String id, Pantry pantry)
{
  throw Error();
}