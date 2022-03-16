import 'package:cheffron_mobile/main.dart';
import 'package:flutter/material.dart';

//TODO: pantry doesn't save when exiting
//TODO: option to delete an ingredient

class PantryPage extends StatefulWidget {
  @override
  _PantryPageState createState() => _PantryPageState();
}

class IngredientListing {
  String name;
  int quantity;
  String unit;

  IngredientListing(
      this.name,
      this.quantity,
      this.unit
  );
}

class _PantryPageState extends State<PantryPage> {
  List<IngredientListing> ingredientsList = [];
  @override
  Widget build(BuildContext context) {
    //function to add an ingredient
    void addIngredient(IngredientListing ingredientListing) {

      setState(() {
        ingredientsList.add(ingredientListing);
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
            content: AddUserDialog(addIngredient),
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
        leading: const BackButton(
          color: Color(0xFFBDBDBD),
        ),
        title: const Text('Pantry', style: TextStyle( color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                  ingredientsList[index].quantity.toString() + "" + ingredientsList[index].unit,
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
          onPressed: showUserDialog
      ),
    );
  }
  }
//user dialog class
class AddUserDialog extends StatefulWidget {
  final Function(IngredientListing) addUser;
  AddUserDialog(this.addUser);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
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
                final ingredient = IngredientListing(ingredientName.text, int.parse(ingredientQuantity.text), ingredientUnit.text);
                widget.addUser(ingredient);
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