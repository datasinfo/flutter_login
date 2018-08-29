import 'package:flutter/material.dart';
import './blocs/provider.dart';
import 'pages/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
