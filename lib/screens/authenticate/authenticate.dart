import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool shoSignIn = true;
  void toggleView() {
    setState(() => shoSignIn = !shoSignIn );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: shoSignIn ? SignIn(toggleView:toggleView) : Register(toggleView:toggleView)
    );
  }
}