import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:cheffron_mobile/Service/UserService.dart';
import 'package:cheffron_mobile/Model/User.dart';
import 'package:cheffron_mobile/Screens/HomePage.dart';
import 'package:cheffron_mobile/SharedPreference.dart';
import 'package:cheffron_mobile/Style.dart';

FutureBuilder<String> buildFutureBuilder(User user) {
  return FutureBuilder<String>(
    future: createAccount(user),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    },
  );
}

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

  bool _isObscure = true;
  bool _isVisible = false;

  fetchCredentials() {
    var firstName = "";
    var lastName = "";
    var email = "";
    var username = "";
    var password = "";
    return [firstName, lastName,email, username, password];
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

            // Signup text Widget
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



            // FirstName input
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
                    controller: firstnameController, // Controller for firstname
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "First Name",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),

            //divider between Firstname and Lastname
            const SizedBox(
              height: 30,
            ),


            // Lastname input
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
                    controller: lastnameController, // Controller for lastname
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last Name",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),

            //divider between Lastname and email
            const SizedBox(
              height: 30,
            ),


            //Email input
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
                    controller: emailController, // Controller for Email
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(20)),
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ],
              ),
            ),

            //divider between email and username
            const SizedBox(
              height: 30,
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
                          hintText: " Create Password",
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

            // Create Account button
            Container(
              width: 570,
              height: 70,
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: yellow,
                  child: const Text(
                      "Create Account", style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    if (kDebugMode) {
                      print("First Name:${firstnameController.text},Last Name: ${lastnameController.text}, Email: ${emailController.text}Username: ${usernameController
                          .text}, password: ${passwordController.text}");
                      if (firstnameController.text== fetchCredentials()[0] && lastnameController == fetchCredentials()[0]&& emailController == fetchCredentials()[0] &&
                          usernameController.text == fetchCredentials()[0] &&
                          passwordController.text == fetchCredentials()[1]) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                              (Route<dynamic> route) => false,
                        );
                        var user = User(firstnameController.text + " " + lastnameController.text, usernameController.text, emailController.text, passwordController.text);
                        var _futureAccount = buildFutureBuilder(user);
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
                child: Text("Already have an account? Log In!",
                  style: TextStyle(color: yellow),),
                disabledColor: blue, //only needed because the button does nothing for now
              ),
            )
          ],
        ));
  }
}