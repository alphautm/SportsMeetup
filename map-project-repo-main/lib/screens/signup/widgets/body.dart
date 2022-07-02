import 'package:flutter/material.dart';
import 'package:porcupine_project/screens/participant/main/main_screen.dart';
import 'package:provider/provider.dart';
import '../../../models/user.dart';
import '../../user_selection.dart';
import '../../view.dart';
import '../signup_screen.dart';
import '../signup_viewmodel.dart';
//import '../../../services/auth/auth_service_firebase.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final SignupScreenState _state;
  void _onSignup(BuildContext context, SignupViewmodel viewmodel) async {
    final User _user = await viewmodel.authenticate();

    if (_user != null) {
      Navigator.push(context, UserSelection.route(data: _user));
    }
    if (_user == null) {
      print("User not found");
    }
    // context.read<AuthServiceFirebase>().authenticate(
    // login: viewmodel.username,
    //    password: viewmodel.password,
    //  );
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: SignupViewmodel(),
      builder: (context, viewmodel, _) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              const Color(0xFFE55D87),
              const Color(0xFFEA384D),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 136.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sport MeetUp',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade100,
                  fontFamily: 'Source Sans Pro',
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              _buildTextField(
                  hint: 'Username',
                  icon: Icons.account_circle_outlined,
                  onChanged: (value) => viewmodel.username = value),
              SizedBox(height: 30.0),
              _buildTextField(
                  hint: 'Email',
                  icon: Icons.email,
                  onChanged: (value) => viewmodel.email = value),
              SizedBox(height: 30.0),
              _buildTextField(
                  hint: 'Password (minimum 6 characters)',
                  isObsecure: !viewmodel.showPassword,
                  icon: Icons.lock,
                  button: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () =>
                          viewmodel.showPassword = !viewmodel.showPassword),
                  onChanged: (value) => viewmodel.password = value),
              SizedBox(
                height: 25,
              ),
              _buildButtons(context, viewmodel),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Text('Already have an account?',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontFamily: 'Source Sans Pro',
                        decoration: TextDecoration.underline,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              if (viewmodel.showErrorMessage)
                Text(
                  "Email or password format not correct",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      background: Paint()
                        ..strokeWidth = 30.0
                        ..color = Colors.blue[600]
                        ..style = PaintingStyle.stroke
                        ..strokeJoin = StrokeJoin.round),
                )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        icon: Icon(icon, color: Colors.white70),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white38),
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context, SignupViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 370.0,
          height: 40.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          margin: EdgeInsets.only(top: 15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow[50],
            ),
            child: Text("Sign Up",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontFamily: 'Source Sans Pro',
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () => _onSignup(context, viewmodel),
          ),
        ),
        SizedBox(width: 10.0),
      ],
    );
  }
}
