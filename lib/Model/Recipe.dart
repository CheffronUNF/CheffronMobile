import 'package:cheffron_mobile/Model/Ingredient.dart';

class Recipe
{
  String? recipeId;
  String? userId;
  late String recipeName;
  late String directions;
  late List<Ingredient> ingredients;
  late int servings;
  late int time;
  bool? glutenFree;
  bool? spicy;
  bool? isPrivate;

  Recipe(
      this.recipeName,
      this.directions,
      this.ingredients,
      this.servings,
      this.time,
      this.glutenFree,
      this.spicy
      );

  Recipe.fromJson(Map<String, dynamic> json):
        recipeId = json['recipeId'],
        userId = json['userId'],
        recipeName = json['name'],
        directions = json['quantity'],
        ingredients = json['ingredients'],
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
}