import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cheffron_mobile/Style.dart';



class RecipePage extends StatefulWidget{
  const RecipePage({Key ? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final image = "Assets/Food.jpg";
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
                          children: const <Widget>[
                            Text(
                              "[Recipe Name]",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                        const Text(
                          "By [username]",
                          style: TextStyle(
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
                                        "8",
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
                                        "3 Hours",
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

                        const Text(
                          "1.  2 eggplants)\n"
                              "2.  6 Roma tomatoes)\n"
                              "3.  2 Yellow Squashes)\n"
                              "4.  2 Zucchinis)\n"
                              "5.  2 tablespoons olive oil)\n"
                              "6.  1 onion, diced\n"
                              "7.  4 cloves garlic, minced\n"
                              "8.  1 red bell pepper, diced\n"
                              "9.  1 yellow bell pepper, diced\n"
                              "10. Salt, to taste\n"
                              "11. Pepper, to taste\n"
                              "12. 28 oz can of crushed tomatoes\n"
                              "13. 2 tablespoons chopped fresh basil\n"
                              "14. 1 teaspoon garlic, minced\n"
                              "15. 2 tablespoons Chopped fresh parsley\n"
                              "16. 4 tablespoons olive oil",
                          style: TextStyle(
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

                        const Text(
                              "1. Preheat the oven for 375˚F (190˚C)\n"
                              "2. Slice the eggplant, tomatoes, squash, and zucchini into approximately ¹⁄₁₆-inch (1-mm) rounds, then set aside.\n"
                              "3. Make the sauce: Heat the olive oil in a 12-inch (30-cm) oven-safe pan over medium-high heat. Sauté the onion, garlic, and bell peppers until soft, about 10 minutes. Season with salt and pepper, then add the crushed tomatoes. Stir until the ingredients are fully incorporated. Remove from heat, then add the basil. Stir once more, then smooth the surface of the sauce with a spatula.\n"
                              "4. Arrange the sliced veggies in alternating patterns, (for example, eggplant, tomato, squash, zucchini) on top of the sauce from the outer edge to the middle of the pan. Season with salt and pepper.\n"
                              "5. Make the herb seasoning: In a small bowl, mix together the basil, garlic, parsley, thyme, salt, pepper, and olive oil. Spoon the herb seasoning over the vegetables.\n"
                              "6. Cover the pan with foil and bake for 40 minutes. Uncover, then bake for another 20 minutes, until the vegetables are softened.\n"
                              "7. Serve while hot as a main dish or side. The ratatouille is also excellent the next day--cover with foil and reheat in a 350˚F (180˚C) oven for 15 minutes, or simply microwave to desired temperature.\n"
                              "8. Enjoy!\n",
                          style: TextStyle(
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