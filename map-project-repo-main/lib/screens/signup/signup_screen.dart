import 'package:flutter/material.dart';

import 'widgets/body.dart';

class SignupScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SignupScreen());

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  showAlertDialog(BuildContext context) {
    // set up the button
    String contentText = "Content of Dialog";
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          elevation: 24.8,
          title: Text("Title of Dialog"),
          content: Text(contentText),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(
            state: this,
          ),
        ),
      ),
    );
  }
}
