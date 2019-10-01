import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    var password_visible = false;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigo, Colors.deepPurpleAccent, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white70),
                      icon: Icon(Icons.mail),
                    ),
                    validator: (value) {
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
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      errorStyle: TextStyle(color: Colors.white70),
                      suffixIcon: IconButton(
                        icon: Icon(password_visible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            password_visible = !password_visible;
                          });
                        },
                      )),
                  validator: (value) {
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
                      double email = double.parse(emailController.text);
                      double password = double.parse(passwordController.text);
                    });
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),

            ],
          ),
        )

      ),
    );
  }
}
