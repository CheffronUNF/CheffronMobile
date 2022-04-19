import 'package:cheffron_mobile/main.dart';
import 'package:flutter/cupertino.dart';

class AddRecipe extends StatefulWidget{
  const AddRecipe({Key ? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe>{
  @override
  Widget build(BuildContext context){
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 80,
            width: 200,
          ),

          Container(
            height: 60,
            width: screenWidth * 0.8,
          )

    ]
      ),
    );
  }
}