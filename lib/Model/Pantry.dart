import 'Ingredient.dart';

class Pantry
{
  late List<Ingredient> ingredients;

  Pantry(
    this.ingredients
  );

  Pantry.fromJson(Map<String, dynamic> json):
    ingredients = _parseIngredients(json['ingredients']);

  Map<String, dynamic> toJson() => {
    'ingredients': ingredients
  };

  static List<Ingredient> _parseIngredients(List<dynamic> json) {
    print(json);
    List<Ingredient> ingredients = [];

    for (var ingredient in json)
    {
      ingredients.add(Ingredient.fromJson(ingredient));
    }

    return ingredients;
  }
}