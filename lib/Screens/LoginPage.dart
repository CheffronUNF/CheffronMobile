import 'package:cheffron_mobile/Screens/SignUpPage.dart';
import 'package:cheffron_mobile/Service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cheffron_mobile/Screens/HomePage.dart';
import 'package:cheffron_mobile/Style.dart';

import '../Components/TextInput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Widget _loadingPlaceholder;

  _LoginScreenState() {
    _loadingPlaceholder = const SizedBox(height: 30);
  }

  _tryLogin() {
    if (kDebugMode) {
      //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (_) => false);
    }

    _loadingPlaceholder = const CircularProgressIndicator();
    login(usernameController.text, passwordController.text).then(_tryLoginCallback);
  }

  _tryLoginCallback(String result) {
    switch (result) {
      case "success":
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (_) => false);
        break;
      case "fail":
        _loadingPlaceholder = const Text("Incorrect username/password");
        break;
    }
  }


  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => Scaffold(
    backgroundColor: blue,
    body: _buildScrollView(),
  );

  _buildScrollView() => SingleChildScrollView(
    reverse: true,
    padding: const EdgeInsets.all(20),
    child: _buildContentColumn(),
  );

  _buildContentColumn() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const SizedBox(height: 30),
      _buildLogoDisplay(),

      const SizedBox(height: 10, width: 10),
      TextInput(hint: "Username", controller: usernameController),

      const SizedBox(height: 30),
      TextInput(hint: "Password", controller: passwordController, obscure: true),

      const SizedBox(height: 50),
      _loadingPlaceholder,

      const SizedBox(height: 100),
      _buildLoginButton(),
      _buildSignUpButton()
    ],
  );

  _buildLogoDisplay() => Center(
    child: Container(
      height: 50,
      width: 400,
      alignment: Alignment.center,
      child: const Text(
        "Welcome to Cheffron",
        style: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  _buildLoginButton() => Container(
    width: 570,
    height: 70,
    padding: const EdgeInsets.only(top: 20),
    child: RaisedButton(
      color: yellow,
      child: const Text("LOG IN", style: TextStyle(color: Colors.white)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () => _tryLogin()
    ),
  );

  _buildSignUpButton() => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: RaisedButton(
      color: blue,
      elevation: 0,
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen())),
      child: const Text("Don't have an account? Sign up!", style: TextStyle(color: yellow))
    ),
  );
}
