import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/Recipe.dart';
import '../main.dart';

var _url = Uri.parse('https://elian.tk:8808/recipe');

Future<List<Recipe>> getRecipes() async
{
  final response = await http.get(_url);
  List<Recipe> recipes = [];

  if (response.statusCode == 200)
  {
    var res = jsonDecode(response.body);

    for (var json in res)
    {
      recipes.add(Recipe.fromJson(json));
    }
  }

  return recipes;
}

Future<String> createRecipe(Recipe recipe) async
{
  String jwt;

  try {
    jwt = preferences.read("jwt");
  }
  catch (ex) {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.post(_url, headers: headers, body: recipe.toJson());

  switch (response.statusCode)
  {
    case 201:
      return "success";
    default:
      return "fail";
  }
}

Future<Recipe?> getRecipe(String id) async
{
  final response = await http.get(_url.resolve('/id'));

  switch (response.statusCode)
  {
    case 200:
      return Recipe.fromJson(jsonDecode(response.body));
    default:
      return null;
  }
}

Future<String> updateRecipe(String id, Recipe recipe) async
{
  String jwt;

  try {
    jwt = preferences.read("jwt");
  }
  catch (ex) {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.patch(_url.resolve('/id'), headers: headers, body: recipe.toJson());

  switch (response.statusCode)
  {
    case 201:
      return "success";
    default:
      return "fail";
  }
}

Future<String> deleteRecipe(String id) async
{
  String jwt;

  try {
    jwt = preferences.read("jwt");
  }
  catch (ex) {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.delete(_url.resolve('/id'), headers: headers);

  switch (response.statusCode)
  {
    case 200:
      return "success";
    default:
      return "fail";
  }
}