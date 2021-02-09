import 'package:flutter/material.dart';
import './sign_up.dart';
import '../widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
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

      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Spacer(),

              TextFormField(
                validator: (val){
                  return val.isEmpty ?  "Enter a valid email" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 6.0,),

              TextFormField(
                obscureText: true,
                validator: (val){
                  return val.isEmpty ?  "Enter a valid password" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val){
                  password = val;
                },
              ),

              SizedBox(height: 24.0,),

              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 48,
                  child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                ),
              ),

              SizedBox(height: 18.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(fontSize: 15.5),),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:
                       (context) => SignUp()));
                      },
                    child: new Text("Sign Up ", style: TextStyle(fontSize: 15.5,
                    decoration: TextDecoration.underline),),
                  ),
                ],
              ),
              SizedBox(height: 80.0,)
            ],
          ),
        ),
      ),
    );
  }
}
