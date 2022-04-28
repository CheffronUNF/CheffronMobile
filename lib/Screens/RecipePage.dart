import 'package:flutter/material.dart';
import 'package:cheffron_mobile/Style.dart';

import '../Model/Recipe.dart';
import '../Model/User.dart';



class RecipePage extends StatefulWidget{
  final Recipe recipe;
  final User? owner;

  const RecipePage(this.recipe, this.owner, {Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final image = "Assets/Food.jpg";

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => Scaffold(
    body: _buildContentContainer(),
  );

  _buildContentContainer() => Container(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: <Widget>[
        Container(color: yellow), ///Image can go here
        _buildScrollSheet()
      ],
    ),
  );

  _buildScrollSheet() => DraggableScrollableSheet(
    maxChildSize: 1,
    initialChildSize: 0.9, ///lower if we have images
    minChildSize: 0.9,
    builder: (context, controller) => _buildScrollView(controller),
  );
  
  _buildScrollView(ScrollController controller) => SingleChildScrollView(
    controller: controller,
    child: Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                widget.recipe.recipeName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
            ],
          ),
          Text(
            "By ${widget.owner != null ? widget.owner!.username : "unknown"}",
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 4),
          const SizedBox(height: 24),

          ///Container for food information
          Container(
            child: Row(
              children: <Widget>[
                Expanded(child: _buildFoodInfoBox("Serves", widget.recipe.servings.toString())),
                const SizedBox(width: 10),
                const SizedBox(width: 10),
                Expanded(child: _buildFoodInfoBox("Time", widget.recipe.time)),
              ],
            ),
          ),

          const SizedBox(height: 24),
          _buildIngredientsHeader(),

          const SizedBox(height: 4),
          _buildIngredientsList(),

          const SizedBox(height: 24),
          _buildDirectionsHeader(),

          const SizedBox(height: 4),
          _buildDirectionsBox(),
        ],
      ),
    ),
  );

  _buildFoodInfoBox(String title, String value) => Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
        Border.all(color: Colors.grey)),
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      children: <Widget>[
        Text(title, style: const TextStyle(color: Colors.grey)),
        Text(value, style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );

  _buildIngredientsHeader() => const Text(
    "Ingredients",
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold),
  );

  _buildIngredientsList() => Text(
    _getIngredients(widget.recipe),
    style: const TextStyle(
        fontWeight: FontWeight.w300, color: Colors.grey),
  );

  _buildDirectionsHeader() => const Text(
    "Directions",
    style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold),
  );

  _buildDirectionsBox() => Text(
    widget.recipe.directions,
    style: const TextStyle(
        fontWeight: FontWeight.w300, color: Colors.grey),
  );
}

_getIngredients(Recipe recipe)
{
  var ingredients = "";

  for (var ingredient in recipe.ingredients)
  {
    ingredients += '${ingredient.quantity} ${ingredient.unit} ${ingredient.name}';
  }

  return ingredients;
}