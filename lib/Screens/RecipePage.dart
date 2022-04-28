import 'package:flutter/material.dart';
import 'package:cheffron_mobile/Style.dart';

import '../Model/Recipe.dart';
import '../Model/User.dart';



class RecipePage extends StatefulWidget{
  final Recipe recipe;
  final User? owner;

  const RecipePage(this.recipe, this.owner, {Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState(recipe, owner);
}

class _RecipePageState extends State<RecipePage> {
  final Recipe recipe;
  final User? owner;

  final image = "Assets/Food.jpg";

  _RecipePageState(this.recipe, this.owner);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              //Image can go here
              color: yellow,
            ),
            ///Container for more content
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.9, //lower if we have images
              minChildSize: 0.9,
              builder: (context, controller) {
                return SingleChildScrollView(
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
                              recipe.recipeName,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                          ],
                        ),
                        Text(
                          "By ${owner != null ? owner!.username : "unknown"}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        ///Container for food information
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(color: Colors.grey)),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: <Widget>[
                                      const Text(
                                        "Serves",
                                        style: TextStyle(
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        recipe.servings.toString(),
                                        style: TextStyle(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(color: Colors.grey)),
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: <Widget>[
                                      const Text(
                                        "Time",
                                        style: TextStyle(
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        recipe.time,
                                        style: TextStyle(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        const Text(
                          "Ingredients",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          _getIngredients(recipe),
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        const Text(
                          "Directions",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          recipe.directions,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
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