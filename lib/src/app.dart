import 'package:flutter/material.dart';
import 'dart:async';
import 'pages/login_page.dart';

class App extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginPage(),
        ),
      );
    }
}