import 'package:cheffron_mobile/Screens/AddRecipePage.dart';
import 'package:cheffron_mobile/Screens/PantryPage.dart';
import 'package:cheffron_mobile/Screens/RecipePage.dart';
import 'package:cheffron_mobile/Style.dart';
import 'package:cheffron_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController recipeSearchString = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: true,
            pinned: true,
            centerTitle: true,
            snap: false,
            actionsIconTheme: const IconThemeData(opacity: 0.0),
            title: const Text('Your Recipes', style: TextStyle( color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.white,
            bottom: AppBar(
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 15),
                width: screenWidth * 0.6,
                height: 55,
                color: Colors.white,
                child: Center(
                  child: TextFormField(
                    controller: recipeSearchString,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(fontSize: 18, color: Color(0xFFBDBDBD)),
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: const Color(0xFFF6F6F6)
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
              itemExtent: 100,
              delegate: SliverChildBuilderDelegate(
                      (context, index){
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: InkWell(
                        child: Container(
                          color: Colors.white,
                          height: 90,
                          alignment: Alignment.center,
                          child: Text(
                            'Recipe $index'
                        ),
                      ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecipePage()),
                          );
                        },
                      )
                    );
                  },
                  childCount: 10
              )
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
              height: 70,
              width: 70,
              right: 30,
              bottom: 15,
              child: FloatingActionButton(
                heroTag: "Add button",
                backgroundColor: yellow,
                child: const Icon(Icons.add, size: 50,),
                onPressed: (){
                  print ('add pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddRecipe()),
                  );
                }
              )
          ),
          Positioned(
              height: 70,
              width: 70,
              left: 30,
              bottom: 15,
              child: FloatingActionButton(
                heroTag: "Settings button",
                  backgroundColor: yellow,
                  child: const Icon(Icons.settings, size: 40,),
                  onPressed: (){
                    print ('settings pressed');
                  },
              )
          ),
          Positioned(
            width: 130,
            bottom: 20,
              child: FloatingActionButton(
                heroTag: "Pantry buttton",
                  backgroundColor: yellow,
                  child: const Text('PANTRY', style: TextStyle(fontSize: 18),),
                  onPressed: (){
                    print ('pantry pressed');
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PantryPage()),
                    );
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
              )
          )
        ],
      ),
    );
  }
}