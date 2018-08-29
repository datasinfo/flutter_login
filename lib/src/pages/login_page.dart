import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

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
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: (value) {
            bloc.emailChangeSink(value);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Email',
            hintText: 'abc@gmail.com',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: (value) {
            bloc.passwordChangeSink(value);
          },
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Password',
            hintText: 'password',
            errorText: snapshot.error,
          ),
        );
      },
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
