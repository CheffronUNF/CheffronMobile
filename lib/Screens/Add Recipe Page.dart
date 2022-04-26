import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../IngredientListing.dart';
import 'Pantry Page.dart';
//TODO: Fix keyboard issue
class AddRecipe extends StatefulWidget{
  const AddRecipe({Key ? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}


class _AddRecipeState extends State<AddRecipe>{
  TextEditingController recipeName = TextEditingController();
  TextEditingController serves = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController ingredients = TextEditingController();
  TextEditingController directions = TextEditingController();

  List<IngredientListing> ingredientsList = [];
/*
  loadSharedPrefs() async {
    try {
      var ingredientsListStart = await sharedPref.read('ingredient');
      ingredientsList.add(IngredientListing.fromJson(ingredientsListStart));
      print('loaded');
    } catch (Excepetion) {
      var ingredientsListStart = await sharedPref.read('ingredientList');
      print('loading failed');
      print(ingredientsListStart);
    }
  }

 */



  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    void addIngredient(IngredientListing ingredientListing) {
      setState(() {
        ingredientsList.add(ingredientListing);
        sharedPref.save('recipeList', ingredientsList);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddIngredientDialog.addIngredientDialog(addIngredient),
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blue,
      body: Column(

        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),

          Center(
            child: Container(
              height: screenHeight * 0.08,
              width: screenWidth * 0.85,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: recipeName, // Controller for recipe name
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Recipe Name",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * 0.025,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: serves, // Controller for recipe name
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Amount served",
                          contentPadding: EdgeInsets.all(20)),
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: screenWidth * 0.05,
              ),

              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: time, // Controller for recipe name
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Time to cook",
                          contentPadding: EdgeInsets.all(20)),
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                  ],
                ),
              )

            ],
          ),

          /*
          Center(
            child: Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.85,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    minLines: 1,
                    maxLines: 6,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    controller: ingredients, // Controller for recipe name
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ingredients",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),
          ),

           */

          SizedBox(
            height: screenHeight * 0.03,
          ),

          Center(
            child: Container(
              height: screenHeight * 0.20,
              width: screenWidth * 0.85,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    minLines: 1,
                    maxLines: 7,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    controller: directions, // Controller for recipe name
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Directions",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: screenHeight * 0.02,
          ),

          Container(
            height: screenHeight * 0.04,
            child: const Text("INGREDIENTS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28)),
          ),

          Container(
            height: screenHeight * 0.3,
            width: screenWidth * 0.9,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.all(4),
                  elevation: 8,
                  child: ListTile(
                    title: Text(
                      ingredientsList[index].name,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      ingredientsList[index].quantity.toString() + "" +
                          ingredientsList[index].unit,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ),
                );
              },
              itemCount: ingredientsList.length,
            ),
          ),


          SizedBox(
            height: screenHeight * 0.03,
          ),

          FloatingActionButton.extended(
            backgroundColor: yellow,
            //child: const Icon(Icons.add, size: 50,),
            onPressed: showUserDialog,
            heroTag: "Add ingredient",
            label: const Text("Add Ingredient"),
            
          ),

        ],
      ),
    );

  }
}