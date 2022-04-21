import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget{
  const AddRecipe({Key ? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe>{
  TextEditingController recipeName = TextEditingController();
  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: blue,
      body: Column(

        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Center(
          child: Container(
            height: 60,
            width: screenWidth * 0.8,
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
          )
        ],
      ),
    );

  }
}