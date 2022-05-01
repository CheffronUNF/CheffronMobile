import 'dart:convert';
import 'package:cheffron_mobile/CheffronConfig.dart';
import 'package:http/http.dart' as http;
import '../Model/Recipe.dart';
import '../main.dart';

var _url = cheffronURL.resolve("/recipe");

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

Future<String> createRecipe(Recipe recipe) async {
  var jwt = await preferences.jwt();

  if (jwt == null)
  {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.post(_url, headers: headers, body: jsonEncode(recipe.toJson()));

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
  final response = await http.get(_url.resolve('/recipe/$id'));

  switch (response.statusCode)
  {
    case 200:
      return Recipe.fromJson(jsonDecode(response.body));
    default:
      return null;
  }
}

Future<String> updateRecipe(String id, Recipe recipe) async {
  var jwt = await preferences.jwt();

  if (jwt == null)
  {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.patch(_url.resolve('/recipe/$id'), headers: headers, body: jsonEncode(recipe.toJson()));

  switch (response.statusCode)
  {
    case 201:
      return "success";
    default:
      return "fail";
  }
}

Future<String> deleteRecipe(String id) async {
  var jwt = await preferences.jwt();

  if (jwt == null)
  {
    return "fail";
  }

  var headers = {"jwt":jwt};
  final response = await http.delete(_url.resolve('/recipe/$id'), headers: headers);

  print(response.statusCode);
  switch (response.statusCode)
  {
    case 200:
      return "success";
    default:
      return "fail";
  }
}