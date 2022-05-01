import 'package:cheffron_mobile/Screens/HomePage.dart';
import 'package:cheffron_mobile/Service/RecipeService.dart';
import 'package:cheffron_mobile/Service/UserService.dart';
import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cheffron_mobile/Style.dart';

import '../Model/Recipe.dart';
import '../Model/User.dart';



class RecipePage extends StatefulWidget{
  final Recipe recipe;
  late User? owner;

  RecipePage(this.recipe, {Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final image = "Assets/Food.jpg";

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => Scaffold(
    backgroundColor: Colors.white,
    body: _buildContentFutureBuilder(),
  );

  _buildContentFutureBuilder() => FutureBuilder(
      future: getUser(widget.recipe.userId!),
      builder: (context, snapshot) {
        if (snapshot.hasData)
        {
          dynamic owner = snapshot.data;
          widget.owner = owner;

          return _buildContentContainer();
        }

        return _buildLoadingView();
      }
  );

  _buildLoadingView() => Scaffold(
    backgroundColor: Colors.white,
    body: Center(
        child: Column(
          children: const [
            SizedBox(height: 300),
            CircularProgressIndicator()
          ],
        )
    ),
  );

  _buildContentContainer() => SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: <Widget>[
        Container(height: 200, color: yellow), ///Image can go here
        _buildScrollSheet()
      ],
    ),
  );

  _buildScrollSheet() => DraggableScrollableSheet(
    maxChildSize: 1,
    initialChildSize: 0.8, ///lower if we have images
    minChildSize: 0.8,
    builder: (context, controller) => _buildScrollView(controller),
  );
  
  _buildScrollView(ScrollController controller) => SingleChildScrollView(
    controller: controller,
    child: _buildScrollContent(),
  );

  _buildScrollContent() => Container(
    padding: const EdgeInsets.all(24),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40))),
    child: _buildContentColumn(),
  );

  _buildContentColumn() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _buildHeaderRow(),

      const SizedBox(height: 28),
      _buildFoodInfoContainer(),

      const SizedBox(height: 24),
      _buildIngredientsHeader(),

      const SizedBox(height: 4),
      _buildIngredientsList(),

      const SizedBox(height: 24),
      _buildDirectionsHeader(),

      const SizedBox(height: 4),
      _buildDirectionsBox(),
    ],
  );

  _buildHeaderRow() => Row(
    children: [
      _buildHeaderColumn(),
      const Spacer(),
      _buildTrashFutureBuilder()
    ],
  );

  _buildHeaderColumn() => Column(
    children: [
      _buildRecipeNameHeader(),
      _buildOwnerHeader(),
    ],
  );

  _buildRecipeNameHeader() => Text(
    widget.recipe.recipeName,
    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );

  _buildOwnerHeader() => Text(
    "By ${widget.owner != null ? widget.owner!.username : "unknown"}",
    style: const TextStyle(fontWeight: FontWeight.w300),
  );

  _buildTrashFutureBuilder() => FutureBuilder(
    future: preferences.userId(),
    builder: (context, snapshot) {
      if (snapshot.hasData && snapshot.data == widget.recipe.userId)
        {
          return _buildTrashButton();
        }

      return const SizedBox();
    },
  );

  _buildTrashButton() => IconButton(
    icon: const Icon(CupertinoIcons.trash),
    color: Colors.grey,
    onPressed: _showConfirmationDialog
  );

  _showConfirmationDialog() async => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => _buildConfirmationDialog()
  );

  _buildConfirmationDialog() => AlertDialog(
    content: const Text("Are you sure you want to delete this recipe?"),
    actions: [
      TextButton(
          child: const Text("Yes"),
          onPressed: () => {
            Navigator.of(context).pop(),
            _tryDeleteRecipe()
          }
      ),
      TextButton(
          child: const Text("No"),
          onPressed: () => Navigator.of(context).pop()
      )
    ],
  );

  _tryDeleteRecipe() {
    deleteRecipe(widget.recipe.recipeId!).then(_tryDeleteRecipeCallback);
  }

  _tryDeleteRecipeCallback(String result) {
    switch (result) {
      case "success":
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (_) => false);
        break;
      default:
        _showErrorDialog();
        break;
    }
  }

  _showErrorDialog() async => showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _buildErrorDialog()
  );

  _buildErrorDialog() => AlertDialog(
    content: const Text("Failed to delete recipe!"),
    actions: [
      TextButton(
          child: const Text("OK"),
          onPressed: () => Navigator.of(context).pop()
      )
    ],
  );

  _buildFoodInfoContainer() => Container(
    child: Row(
      children: <Widget>[
        Expanded(child: _buildFoodInfoBox("Serves", widget.recipe.servings.toString())),
        const SizedBox(width: 10),
        const SizedBox(width: 10),
        Expanded(child: _buildFoodInfoBox("Time", widget.recipe.time)),
      ],
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
    ingredients += '${ingredient.quantity} ${ingredient.unit} ${ingredient.name}\n';
  }

  return ingredients;
}