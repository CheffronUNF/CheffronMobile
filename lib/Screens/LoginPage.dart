import 'package:cheffron_mobile/Screens/SignUpPage.dart';
import 'package:cheffron_mobile/Service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:cheffron_mobile/Screens/HomePage.dart';
import 'package:cheffron_mobile/Style.dart';

import '../Components/TextInput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late final List<Widget> _errorColumnChildren = [];

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _tryLogin() {
    _errorColumnChildren.clear();

    var future = login(usernameController.text, passwordController.text);
    future.then(_tryLoginCallback);
  }

  _tryLoginCallback(String result) {
    switch (result) {
      case "success":
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (_) => false);
        break;
      case "fail":
        setState(() => _errorColumnChildren.add(_buildFailedLoginText()));
        break;
    }
  }

  _buildScaffold() => Scaffold(
    backgroundColor: blue,
    body: _buildContentContainer(),
  );

  _buildContentContainer() => Container(
    padding: const EdgeInsets.all(20),
    child: _buildContentColumn(),
  );

  _buildScrollView() => SingleChildScrollView(
    reverse: true,
    padding: const EdgeInsets.all(20),
    child: _buildContentColumn(),
  );

  _buildContentColumn() => Flex(
    direction: Axis.vertical,
    children: <Widget>[
      const SizedBox(height: 30),
      _buildLogoDisplay(),

      const SizedBox(height: 10, width: 10),
      TextInput(hint: "Username", controller: usernameController),

      const SizedBox(height: 30),
      TextInput(hint: "Password", controller: passwordController, obscure: true),

      const SizedBox(height: 20),
      const Expanded(child: SizedBox()),
      Column(children: _errorColumnChildren),
      _buildButtonColumn()
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

  _buildFailedLoginText() => const Text(
      "Incorrect username or password",
      style: TextStyle(color: Colors.red, fontSize: 18)
  );

  _buildButtonColumn() => Column(
    children: [
      _buildLoginButton(),
      _buildSignUpButton(),
    ],
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
