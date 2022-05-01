import 'package:cheffron_mobile/Model/Ingredient.dart';
import 'package:cheffron_mobile/Model/Pantry.dart';
import 'package:cheffron_mobile/Service/PantryService.dart';
import 'package:cheffron_mobile/main.dart';
import 'package:cheffron_mobile/Style.dart';
import 'package:flutter/material.dart';
import '../SharedPreference.dart';
import 'dart:convert';
//TODO: pantry doesn't save when exiting
//TODO: option to delete an ingredient

class PantryPage extends StatefulWidget {
  List<Ingredient> ingredientsList = [];

  PantryPage({Key? key}) : super(key: key);

  @override
  _PantryPageState createState() => _PantryPageState();
}

SharedPref sharedPref = SharedPref();


class _PantryPageState extends State<PantryPage> {

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => Scaffold(
    backgroundColor: Colors.white,
    appBar: _buildHeaderAppBar(),
    body: _buildFutureBuilder(),
    floatingActionButton: _buildAddIngredientButton(),
  );

  _buildHeaderAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    actionsIconTheme: const IconThemeData(color: Colors.black),
    actions:  [
      TextButton(
          onPressed: () {},
          child: Text("Clear All", style: TextStyle(color: yellow),)
      )
    ],
    leading: const BackButton(color: Color(0xFFBDBDBD)),
    title: const Text('Pantry', style: TextStyle(
        color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
  );

  _buildFutureBuilder() => FutureBuilder(
    future: getPantry(),
    builder: (context, snapshot) {
      if (snapshot.hasData)
      {
        dynamic pantry = snapshot.data!;
        widget.ingredientsList = pantry.ingredients;

        return _buildContentContainer();
      }

      return _buildLoadingView();
    }
  );

  _buildLoadingView() => Center(
    child: Column(
      children: const [
        SizedBox(height: 300),
        CircularProgressIndicator()
      ],
    )
  );

  _buildContentContainer() => Container(
    height: MediaQuery.of(context).size.height,
    child: ListView.builder(
      itemBuilder: (ctx, index) => _buildIngredientCard(widget.ingredientsList[index]),
      itemCount: widget.ingredientsList.length,
    ),
  );
  
  _buildIngredientCard(Ingredient ingredient) => Card(
    margin: EdgeInsets.all(4),
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
      trailing: Text("${ingredient.quantity} ${ingredient.unit}",
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xFFBDBDBD),
        ),
      ),
    ),
  );
  
  _buildAddIngredientButton() => FloatingActionButton(
    backgroundColor: yellow,
    child: const Icon(Icons.add, size: 50,),
    onPressed: showUserDialog,
    heroTag: "Add ingredient",
  );
  
  //function to show a dialog allowing user to input ingredients
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

  //function to add an ingredient
  void addIngredient(Ingredient ingredientListing) {
    setState(() {
      widget.ingredientsList.add(ingredientListing);

      updatePantry(Pantry(widget.ingredientsList));
    });
  }
}

//user dialog class
class AddIngredientDialog extends StatefulWidget {
  final Function(Ingredient) addIngredient;
  const AddIngredientDialog.addIngredientDialog(this.addIngredient);

  @override
  _AddIngredientDialogState createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends State<AddIngredientDialog> {
  @override
  Widget build(BuildContext context) {

    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var ingredientName = TextEditingController();
    var ingredientQuantity = TextEditingController();
    var ingredientUnit = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildTextField('Ingredient', ingredientName),
            buildTextField('Quantity', ingredientQuantity),
            buildTextField('Unit', ingredientUnit),
            const SizedBox(
              height: 30
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: yellow, 
              ),
              onPressed: () {
                final ingredient = Ingredient(ingredientName.text, double.parse(ingredientQuantity.text), ingredientUnit.text);
                widget.addIngredient(ingredient);
                Navigator.of(context).pop();
              },
              child: Text('Add Ingredient'),

            ),
          ],
        ),
      ),
    );
  }
}