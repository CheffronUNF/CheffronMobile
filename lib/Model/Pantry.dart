import 'Ingredient.dart';

class Pantry
{
  String? userId;
  late List<Ingredient> ingredients;

  Pantry(
    this.ingredients
  );

  Pantry.fromJson(Map<String, dynamic> json):
    userId = json['userId'],
    ingredients = json['ingredients'];

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'ingredients': ingredients
  };
}