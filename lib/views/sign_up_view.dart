import 'package:flutter/material.dart';
import 'package:bhbbites/services/auth_service.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Will move this to one location
final primaryColor = const Color(0xFFFFFFFF);

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child: SafeArea(
          child: Column(
              children: <Widget>[Text("SignUp")]
          ),
      ),

    );
  }
}
