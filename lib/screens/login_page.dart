import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinnoba/data/api_user_session.dart';
import 'package:provider/provider.dart';
import 'dart:math';


class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();

  bool isHidden = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggle() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/blur.jpeg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Container(
                    child: Form(
                        key: formKey,
                        child: ListView(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 250.0,
                                bottom: 20.0,
                                right: 50.0,
                                left: 50.0),
                            child: TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                  errorStyle: TextStyle(color: Colors.red),
                                  prefixIcon: Icon(
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
                            padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                                right: 50.0,
                                left: 50.0),
                            child: TextFormField(
                              controller: passwordController,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none),
                              obscureText: isHidden,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                  errorStyle: TextStyle(color: Colors.red),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: toggle,
                                    icon: isHidden
                                        ? Icon(Icons.visibility_off,
                                            color: Colors.white)
                                        : Icon(Icons.visibility,
                                            color: Colors.white),
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
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  right: 50.0,
                                  left: 50.0),
                              child: RaisedButton(
                                  child: Text("Sign In",
                                      style: TextStyle(color: Colors.white)),
                                  color: Colors.indigoAccent,
                                  elevation: 6.0,
                                  onPressed: () {
                                    setState(() {
                                      print("Hello");
                                      if (formKey.currentState.validate()) {
                                        String id = ranum().toString();
                                        Map<String, String> map = {
                                          "client_id": "HFGKFB$id"
                                        };

                                        funcasync(
                                            context,
                                            emailController.text.toString(),
                                            passwordController.text.toString(),
                                            map);

//    loginAPI();

                                      }
                                    });
                                  })),
                        ]))))));
  }

//FutureBuilder<Response> loginAPI(
//    BuildContext context ,String username ,String password ,String clientId) {
//  Map<String,String>  map = {"clientId" :"HFGKFB$clientId"};
//  String credentials = username + ":" + password;
//
//  String auth = "Basic " + base64.encode( utf8.encode( credentials ) );
//  print("$map,$auth,$username,$password");
//
//  return FutureBuilder<Response>(
//    future: Provider.of<UserSession>(context).login( auth , map ) ,
//    builder: (context ,snapshot) {
//
//      if(snapshot.connectionState == ConnectionState.done){
//
//        final Map map = json.decode( snapshot.data.bodyString );
//        print(" RESPONSE OF API......${map.toString()}");
//        FLog.error(text: "RESPONSE OF API...   ${map.toString()}");
//        //("The data is.... ${map.toString()}");
//        return Center(
//          child: Text( map.toString( ) ) ,
//        );
//      } else {
//        return Center(
//          child: CircularProgressIndicator( ) ,
//        );
//      }
//    } ,
//);

  funcasync(
      BuildContext context, String username, String password, Map map) async {
    String credentials = username + ":" + password;

    String auth = "Basic " + base64.encode(utf8.encode(credentials));
    print("$map,$auth,$username,$password");

    var response = await Provider.of<UserSession>(context)
        .login(auth, map, "application/json");
    Map dmap = json.decode(response.bodyString);
    print(dmap);
    print("GETTING THE RESPONSE ${dmap['username']}}");



  }


  int ranum() {
    var rng = new Random();
    int d = rng.nextInt(100);
    return d;
  }
}
