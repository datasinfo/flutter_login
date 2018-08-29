import 'package:flutter/material.dart';
import 'dart:async';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(bottom: 20.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email',
          hintText: 'abc@gmail.com'),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Password',
        hintText: 'password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Icon(Icons.check),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
