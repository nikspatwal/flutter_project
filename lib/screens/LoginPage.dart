import 'dart:convert';
import 'dart:ui';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/screens/YesNo.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api_user_session.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(
      ) {
    return LoginPageState( );
  }
}

class LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>( );
  bool flag = false;

  bool isHidden = true;

  TextEditingController userController = TextEditingController( );
  TextEditingController passwordController = TextEditingController( );

  void toggle(
      ) {
    setState( (
        ) {
      isHidden = !isHidden;
    } );
  }

  @override
  Widget build(
      BuildContext context
      ) {
    return Scaffold(
        body: DecoratedBox(
            position: DecorationPosition.background ,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage( "assets/images/sky.jpeg" ) ,
                    fit: BoxFit.cover ) ) ,
            child: Center(
                child: Container(
                  child: Form(
                      key: formKey ,
                      child: Center(child: ListView( children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 250.0 ,
                              bottom: 20.0 ,
                              right: 50.0 ,
                              left: 50.0 ) ,


                          child: TextFormField(
                              controller: userController ,
                              style: TextStyle(
                                  color: Colors.white70 ,
                                  fontSize: 17.0 ,
                                  decoration: TextDecoration.none ) ,
                              decoration: InputDecoration(
                                labelText: "Username" ,
                                labelStyle: TextStyle(
                                  color: Colors.white70 ,),
                                errorStyle: TextStyle( color: Colors.red ) ,
                                prefixIcon: Icon(
                                  Icons.person ,
                                  color: Colors.white70 ,
                                ) ,
                              ) ,
                              validator: (
                                  String value
                                  ) {
                                if(value.isEmpty){
                                  return "Please enter username.";
                                }
                                return null;
                              } ) ,
                        ) ,
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0 ,
                              bottom: 20.0 ,
                              right: 50.0 ,
                              left: 50.0 ) ,
                          child: TextFormField(
                            controller: passwordController ,
                            style: TextStyle(
                                color: Colors.white70 ,
                                fontSize: 17.0 ,
                                decoration: TextDecoration.none ) ,
                            obscureText: isHidden ,
                            cursorColor: Colors.white70 ,
                            decoration: InputDecoration(
                                labelText: "Password" ,
                                labelStyle: TextStyle(
                                  color: Colors.white70 , ) ,
                                errorStyle: TextStyle( color: Colors.red ) ,
                                prefixIcon: Icon(
                                  Icons.lock ,
                                  color: Colors.white70 ,
                                ) ,
                                suffixIcon: IconButton(
                                  onPressed: toggle ,
                                  icon: isHidden
                                      ? Icon( Icons.visibility_off ,
                                      color: Colors.white70 )
                                      : Icon( Icons.visibility ,
                                      color: Colors.white70 ) ,
                                ) ) ,
                            validator: (
                                String value
                                ) {
                              if(value.isEmpty){
                                return "Please enter password.";
                              }
                              return null;
                            } ,
                          ) ,
                        ) ,
                        Padding(
                            padding: EdgeInsets.only(
                                top: 10.0 ,
                                bottom: 10.0 ,
                                right: 50.0 ,
                                left: 50.0 ) ,
                            child: RaisedButton(
                              child: Text( "Sign In" ,
                                  style: TextStyle( color: Colors.white70 ) ) ,
                              color: Colors.indigoAccent ,
                              elevation: 6.0 ,
                              onPressed:(){
                                clickedOne();
                                flag?navigateTo():Center(
                                  child: CircularProgressIndicator(),
                                );

                              },                            )
                        ) ,

                      ] ),)
                  ) ,


                )
            )
        )
    );}


  apiCalling(
      BuildContext context ,String username ,String password ,Map map
      ) async {
//    final client = ChopperClient().get(
//        "https://vinnoba.com/vinnobaapi").timeout(Duration(seconds: 10));

    String credentials = username + ":" + password;

    String auth = "Basic " + base64.encode( utf8.encode( credentials ) );
    print( "$map,$auth,$username,$password" );
    Response response = await Provider.of<UserSession>( context )
        .login( auth ,map ,"application/json" , );
    Map headers = response.headers;
    print(headers.toString());
    Map body = json.decode( response.bodyString );
    print(body.toString());
    flag =true;
    BasicUtils.savePreferences( PrefKeys.token ,headers['x-auth-token'] );
    BasicUtils.savePreferences(PrefKeys.refreshToken, headers['refresh_token']);
    BasicUtils.savePreferences( PrefKeys.username ,body['username'] );
    BasicUtils.savePreferences( PrefKeys.password ,headers['password'] );


//    String token = await  BasicUtils.getPreferences( JsonKeys.token );

  }

  clickedOne() {
    setState( (
        ) {
      print( "Hello" );
      if(formKey.currentState.validate( )){
        String id = BasicUtils.randomNum( )
            .toString( );
        Map<String , String> map = {
          "client_id": "HFGKFB$id"
        };

        apiCalling(
            context ,
            userController.text.toString( ) ,
            passwordController.text.toString( ) ,
            map
        );
      }
    } );
  }
  
  navigateTo(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => YesNo()),
    );
    
  }


}



