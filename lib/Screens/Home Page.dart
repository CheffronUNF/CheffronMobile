import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController recipeSearchString = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(top: 15),
                width: 530,
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
                      child: Container(
                        color: Colors.white,
                        height: 90,
                        alignment: Alignment.center,
                        child: Text(
                            'Recipe $index'
                        ),
                      ),
                    );
                  },
                  childCount: 10
              )
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //TODO: match with figma design
        //currentIndex: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), title: Text('Pantry')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add recipe'))
        ],
      ),
    );
  }
}