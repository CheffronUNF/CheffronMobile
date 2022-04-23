import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            height: screenHeight * 0.05,
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

          SizedBox(
            height: screenHeight * 0.05,
          ),

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

          SizedBox(
            height: screenHeight * 0.05,
          ),

          Center(
            child: Container(
              height: screenHeight * 0.25,
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

        ],
      ),
    );

  }
}