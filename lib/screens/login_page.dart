import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    var _obscureText = true;

    return Scaffold(

        body: DecoratedBox(position: DecorationPosition.background ,decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/blue.jpeg"), fit: BoxFit.cover) ),
        child: Center(
            child: Container(
              height: 330.0,
              width: 300.0,

              child: Form(
                key: formKey,
                child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please enter email.";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: _obscureText,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          )),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter password.";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: RaisedButton(

                      color: Colors.indigoAccent,
                      elevation: 6.0,
                      onPressed: () {
                        setState(() {

                          if(formKey.currentState.validate()){

                            navigate_to_second();

                          }
                        });
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),)
                      )),

            )


    void navigate_to_second (){


    }
    );
  }
}
