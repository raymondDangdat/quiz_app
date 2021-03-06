import 'package:flutter/material.dart';
import '../helpers/functions.dart';
import './home.dart';
import '../services/auth.dart';
import './sign_in.dart';
import '../widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;

  AuthService authService = new AuthService();
  bool _isLoading = false;
  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .signUpWithEmailAndPassword(email, password)
          .then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedIn: true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            ))
          : Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Spacer(),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter a valid name" : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter a valid email" : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val.isEmpty ? "Enter a valid password" : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                      onChanged: (val) {
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    InkWell(
                      onTap: () {
                        signUp();
                      },
                      child: blueButton(context: context, label: "Sign Up"),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 15.5),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 15.5,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.0,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
