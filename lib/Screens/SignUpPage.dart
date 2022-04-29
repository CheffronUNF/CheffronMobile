import 'package:cheffron_mobile/Components/TextInput.dart';
import 'package:cheffron_mobile/Screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:cheffron_mobile/Model/User.dart';
import 'package:cheffron_mobile/Style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  _buildScaffold(BuildContext context) => Scaffold(
    backgroundColor: blue,
    body: _buildScrollView(context),
  );

  _buildScrollView(BuildContext context) => SingleChildScrollView(
    reverse: false,
    padding: const EdgeInsets.all(20),

    child: _buildContentColumn(context)
  );

  _buildContentColumn(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const SizedBox(height: 30),
      _buildLogoDisplay(),

      const SizedBox(height: 10, width: 10),
      TextInput(hint: "First Name", controller: firstnameController),

      const SizedBox(height: 30),
      TextInput(hint: "Last Name", controller: lastnameController),

      const SizedBox(height: 30),
      TextInput(hint: "Email", controller: emailController),

      const SizedBox(height: 30),
      TextInput(hint: "Username", controller: usernameController),

      const SizedBox(height: 30),
      TextInput(hint: "Password", controller: passwordController, obscure: true),

      const SizedBox(height: 40),
      _buildCreateAccountButton(),
      _buildLogInButton()
    ],
  );

  _buildLogoDisplay() => Center(
    child: Container(
      height: 50,
      width: 400,
      alignment: Alignment.center,
      child: const Text(
        "Cheffron",
        style: TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  _buildCreateAccountButton() => Container(
    width: 570,
    height: 70,
    padding: const EdgeInsets.only(top: 20),
    child: RaisedButton(
      color: yellow,
      child: const Text("Create Account", style: TextStyle(color: Colors.white)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        var user = User(firstnameController.text + " " + lastnameController.text, usernameController.text, emailController.text, passwordController.text);
        throw ErrorDescription("Not Implemented.");
      }
    ),
  );

  _buildLogInButton() => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: RaisedButton(
      color: blue,
      elevation: 0,
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
      child: const Text("Already have an account? Log In!", style: TextStyle(color: yellow)),
      disabledColor: blue, //only needed because the button does nothing for now
    ),
  );
}