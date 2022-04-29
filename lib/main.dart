import 'package:cheffron_mobile/Screens/HomePage.dart';
import 'package:cheffron_mobile/SharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'Screens/LoginPage.dart';
import 'Style.dart';

SharedPref preferences = SharedPref();

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
        primarySwatch: Colors.blue,
      ),
      home: _buildScaffold(),
    );
  }

  _buildScaffold() => Scaffold(
    backgroundColor: Colors.white,
    body: _buildColumn(),
  );

  _buildColumn() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildExpanded()
    ],
  );

  _buildExpanded() => Expanded(
    child: _buildFutureBuilder(),
  );

  _buildFutureBuilder() => FutureBuilder(
      future: preferences.read("jwt"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData){
            return const HomePage();
          }

          return const LoginPage();
        }

        return const SizedBox();
      }
  );
}
