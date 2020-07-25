import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SIGN IN',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: FlatButton(
          child: Text('Sign in'),
          onPressed: ()=>print('Signed in'),
        ),
      ) ,

    );
  }
}


