import 'package:cheffron_mobile/Model/Ingredient.dart';
import 'package:cheffron_mobile/main.dart';
import 'package:cheffron_mobile/Style.dart';
import 'package:flutter/material.dart';
import '../SharedPreference.dart';
import 'dart:convert';
//TODO: pantry doesn't save when exiting
//TODO: option to delete an ingredient

class PantryPage extends StatefulWidget {
  const PantryPage({Key? key}) : super(key: key);

  @override
  _PantryPageState createState() => _PantryPageState();
}

SharedPref sharedPref = SharedPref();


class _PantryPageState extends State<PantryPage> {
  List<Ingredient> ingredientsList = [];

  loadSharedPrefs() async {
    try {
      var ingredientsListStart = await sharedPref.read('ingredient');
      ingredientsList.add(Ingredient.fromJson(ingredientsListStart));
      print('loaded');
    } catch (Excepetion) {
      var ingredientsListStart = await sharedPref.read('list');
      print('loading failed');
      print(ingredientsListStart);
    }
  }


    @override
    Widget build(BuildContext context) {


      //function to add an ingredient
      void addIngredient(Ingredient ingredientListing) {
        setState(() {
          ingredientsList.add(ingredientListing);
          sharedPref.save('list', ingredientsList);
        });
      }
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

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actionsIconTheme: const IconThemeData(color: Colors.black),
          actions:  [
            TextButton(
                onPressed: () {
                  //sharedPref.clear();
                  setState(() {

                  });
                },
                child: Text("Clear All", style: TextStyle(color: yellow),))
          ],
          leading: const BackButton(
            color: Color(0xFFBDBDBD),
          ),
          title: const Text('Pantry', style: TextStyle(
              color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: ListView.builder(
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: yellow,
            child: const Icon(Icons.add, size: 50,),
            onPressed: showUserDialog,
            heroTag: "Add ingredient",
        ),
      );
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