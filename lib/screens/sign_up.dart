import 'package:flutter/material.dart';
import './sign_in.dart';
import '../widgets/widgets.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
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
                  return val.isEmpty ?  "Enter a valid name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (val){
                  name = val;
                },
              ),

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
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:
                      (context) => SignIn()));
                },
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
                  Text("Already have an account? ", style: TextStyle(fontSize: 15.5),),
                  Text("Sign Up ", style: TextStyle(fontSize: 15.5,
                      decoration: TextDecoration.underline),),
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
