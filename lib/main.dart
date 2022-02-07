import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

const blue = Color(0xFF1A529F);
const yellow = Color(0xFFE7AA4B);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheffron',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: blue,
        body: const LoginScreen(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "UNF PROJECT",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  fetchCredentials() {
    var username = "username";
    var password = "password123";
    return [username, password];
  }

  @override
  Widget build(BuildContext context) {
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

            // Login text Widget
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: const Text(
                  "Logo will go here",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
              width: 10,
            ),

            // Wrong Password text
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Username or password is incorrect",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

            // Username input
            Container(
              height: 60,
              width: 530,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    controller: usernameController, // Controller for Username
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),

            //divider between username and password
            const SizedBox(
              height: 30,
            ),

            //password input
            Container(
              height: 60,
              width: 530,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onTap: () {
                      setState(() {
                        _isVisible = false;
                      });
                    },

                    controller: passwordController, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: const EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                    obscureText: _isObscure,
                  ),
                ],
              )
            ),

            const SizedBox(
              height: 130,
            ),

            // Login Button
            Container(
              width: 570,
              height: 70,
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: yellow,
                  child: const Text("LOG IN", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    if (kDebugMode) {
                      print(
                          "Username: ${usernameController.text}, password: ${passwordController.text}");
                      if (usernameController.text == fetchCredentials()[0] &&
                          passwordController.text == fetchCredentials()[1]) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                              (Route<dynamic> route) => false,
                        );
                      } else {
                        setState(() {
                          _isVisible = true;
                        });
                      }
                    }
                  }),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const RaisedButton(
                onPressed: null,
                child: Text("Don't have an account? Sign up!", style: TextStyle(color: yellow),),
                disabledColor: blue, //only needed because the button does nothing for now
              ),
            )
          ],
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class recipeListing extends _HomePageState {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey,
        child: const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam elementum dolor eget lorem euismod rutrum.',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

void arr() {
  var arr = ['a','b','c','d','e'];
}

final recipeList = ['a','b','c'];
final recipeMap = recipeList.asMap();


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
              toolbarHeight: 80,
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                padding: const EdgeInsets.only(top: 15),
                width: 530,
                height: 65,
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
       SliverPadding(
            padding: const EdgeInsets.only(top: 30.0),
            sliver:
        SliverFixedExtentList(
          itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
                (context, index){
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.white,
                      height: 90,
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Recipe $index', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                childCount: 10
              )
            )
            ),
          ],
        ),
      );
    }
  }
