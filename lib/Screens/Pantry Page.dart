import 'package:flutter/material.dart';


class PantryPage extends StatefulWidget {
  @override
  _PantryPageState createState() => _PantryPageState();
}

class IngredientListing {
  String name;
  int quantity;

  IngredientListing({
    required this.name,
    required this.quantity,
  });

  String printName(){
    return '${name}';
  }

  String printQuantity(){
    return '${quantity}';
  }
}

List<IngredientListing> myList = [
  IngredientListing(
    name: 'Chorizo Canapes',
    quantity: 1,
  ),
  IngredientListing(
    name: 'Cucumber',
    quantity: 2,
  ),
  IngredientListing(
    name: 'Eggs',
    quantity: 3,
  ),
];

class _PantryPageState extends State<PantryPage> {
  TextEditingController recipeSearchString = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
            pinned: true,
            centerTitle: true,
            snap: false,
            actionsIconTheme: IconThemeData(color: Colors.black),
            leading: BackButton(
              color: Color(0xFFBDBDBD),
            ),
            title: Text('Pantry', style: TextStyle( color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
          ),
          SliverFixedExtentList(
              itemExtent: 60,
              delegate: SliverChildBuilderDelegate(
                      (context, index){
                    return Card(
                      margin: const EdgeInsets.all(0.5),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,0,0,0),
                              child: Container(
                                  child: Text('Ingredient'),
                                  alignment: Alignment.centerLeft,
                                  height: 40,
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.6,0,0,0),
                              child: Container(
                                child: Text('Hello'),
                                alignment: Alignment.centerRight,
                                height: 40,
                                width: 60,
                              )),
                        ],
                      ),
                    );
                  },
                  childCount: 10
              )
          )
        ],
      ),
    );
    }
  }