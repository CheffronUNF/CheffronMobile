import 'package:cheffron_mobile/Model/Ingredient.dart';

class Recipe
{
  String? recipeId;
  String? userId;
  late String recipeName;
  late String directions;
  late List<Ingredient> ingredients;
  late String time;
  late int servings;
  bool glutenFree;
  bool spicy;
  bool isPrivate;

  Recipe(
    this.recipeName,
    this.directions,
    this.ingredients,
    this.servings,
    this.time ,
    this.glutenFree,
    this.spicy,
    this.isPrivate,
  );

  Recipe.fromJson(Map<String, dynamic> json):
    recipeId = json['recipeId'],
    userId = json['userId'],
    recipeName = json['recipeName'],
    directions = json['directions'],
    ingredients = _parseIngredients(json['ingredients']),
    servings = json['servings'],
    time = json['time'],
    glutenFree = json['glutenFree'],
    spicy = json['spicy'],
    isPrivate = json['isPrivate'];

  Map<String, dynamic> toJson() => {
    'recipeName': recipeName,
    'directions': directions,
    'ingredients': ingredients,
    'servings': servings,
    'time': time,
    'glutenFree': glutenFree,
    'spicy': spicy,
    'isPrivate': isPrivate
  };

  static List<Ingredient> _parseIngredients(List<dynamic> json) {
    List<Ingredient> ingredients = [];

    for (var ingredient in json)
    {
      ingredients.add(Ingredient.fromJson(ingredient));
    }

    return ingredients;
  }
}