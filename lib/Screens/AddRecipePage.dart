import 'package:cheffron_mobile/Components/TextInput.dart';
import 'package:cheffron_mobile/Model/Recipe.dart';
import 'package:cheffron_mobile/Screens/HomePage.dart';
import 'package:cheffron_mobile/Service/RecipeService.dart';
import 'package:cheffron_mobile/Style.dart';
import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Ingredient.dart';
import 'PantryPage.dart';

//TODO: Fix keyboard issue
class AddRecipePage extends StatefulWidget{
  const AddRecipePage({Key ? key}) : super(key: key);

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}


class _AddRecipePageState extends State<AddRecipePage>{
  TextEditingController recipeName = TextEditingController();
  TextEditingController serves = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController ingredients = TextEditingController();
  TextEditingController directions = TextEditingController();

  late final screenHeight = MediaQuery.of(context).size.height;
  late final screenWidth = MediaQuery.of(context).size.width;

  List<Ingredient> ingredientsList = [];

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _saveRecipe() {
    var recipe = Recipe(recipeName.text, directions.text, ingredientsList, int.parse(serves.text), time.text, false, false, false);

    createRecipe(recipe).then(_saveRecipeCallback);
  }

  _saveRecipeCallback(String result)  {
    switch (result) {
      case "success":
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      default:
        break;
    }
  }

  _addIngredient(Ingredient ingredientListing) {
    setState(() {
      ingredientsList.add(ingredientListing);
      sharedPref.save('recipeList', ingredientsList);
    });
  }

  _showUserDialog() {
    showDialog(
      context: context,
      builder: (_)  => AlertDialog(
        content: AddIngredientDialog.addIngredientDialog(_addIngredient),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _buildScaffold() => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: blue,
    body: _buildContentContainer(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: _buildButtonStack(),
  );

  _buildContentContainer() => Container(
    padding: const EdgeInsets.all(20),
    child: _buildContentColumn(),
  );

  _buildContentColumn() => Column(
    children: [
      SizedBox(height: screenHeight * 0.1),
      TextInput(hint: "Recipe Name", controller: recipeName, textAlign: TextAlign.center),

      SizedBox(height: screenHeight * 0.025),
      _buildTextInputRow(),

      SizedBox(height: screenHeight * 0.03),
      _buildDirectionsContainer(),

      SizedBox(height: screenHeight * 0.02),
      _buildIngredientsHeader(),
      _buildIngredientsList(),

      SizedBox(height: screenHeight * 0.03),
    ],
  );

  _buildTextInputRow() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextInput(hint: "Amount Served", width: screenWidth * .4, controller: serves, textAlign: TextAlign.center),
      const Expanded(child: SizedBox()),
      TextInput(hint: "Time to Cook", width: screenWidth * .4, controller: time, textAlign: TextAlign.center),
    ],
  );

  _buildDirectionsContainer() => Center(
    child: Container(
      height: screenHeight * 0.20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white),
      child: Column(
        children: <Widget>[_buildDirectionsTextBox()],
      ),
    ),
  );

  _buildDirectionsTextBox() => TextFormField(
    minLines: 1,
    maxLines: 7,
    controller: directions, // Controller for recipe name
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: "Directions",
      contentPadding: EdgeInsets.all(20)),
    onEditingComplete: () => FocusScope.of(context).nextFocus(),
  );

  _buildIngredientsHeader() => Container(
    height: screenHeight * 0.04,
    child: const Text("INGREDIENTS",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 28)),
  );

  _buildIngredientsList() => Container(
    height: screenHeight * 0.3,
    width: screenWidth * 0.9,
    child: ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) => _buildIngredientCard(ingredientsList[index]),
      itemCount: ingredientsList.length,
    ),
  );

  _buildIngredientCard(Ingredient ingredient) => Card(
    margin: const EdgeInsets.all(4),
    elevation: 8,
    child: ListTile(
      title: Text(
        ingredient.name,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        "${ingredient.quantity} ${ingredient.unit}",
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xFFBDBDBD),
        ),
      ),
    ),
  );

  _buildButtonStack() => Stack(
    alignment: Alignment.center,
    fit: StackFit.expand,
    children: [
      _buildSaveRecipeButton(),
      _buildAddIngredientButton()
    ],
  );

  _buildSaveRecipeButton() => Positioned(
    width: screenWidth * 0.4,
    right: 30,
    bottom: 15,
    child: FloatingActionButton(
      heroTag: "SaveRecipe",
      backgroundColor: yellow,
      child: const Text('Save Recipe', style: TextStyle(fontSize: 18)),
      onPressed: _saveRecipe,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
    )
  );

  _buildAddIngredientButton() => Positioned(
    width: screenWidth * 0.4,
    left: 30,
    bottom: 15,
    child: FloatingActionButton(
      heroTag: "AddIngredient",
      backgroundColor: yellow,
      child: const Text('Add Ingredient', style: TextStyle(fontSize: 18)),
      onPressed: _showUserDialog,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
    )
  );
}