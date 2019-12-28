import 'dart:convert';
import 'dart:ui';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/screens/ManageVisitors.dart';
import 'package:vinnoba/screens/YesNo.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';


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
                              cursorColor: Colors.white70,
                              keyboardType: TextInputType.text,
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
                                loginApi(context,userController.text.toString(),
                                passwordController.text.toString());
                              })
                        ) ,

                      ] ),)
                  ) ,


                )
            )
        )
    );}



  loginApi(
      BuildContext context ,String username ,String password ) async {
    String id = await BasicUtils.getDeviceId();
    Map<String , String> map = {"client_id": id};
    String credentials = username + ":" + password;
    String auth = "Basic " + base64.encode( utf8.encode( credentials ) );
    print( "$map,$auth,$username,$password" );
    Response response = await Provider.of<AllApi>( context )
        .login( auth ,map ,"application/json" , );
    Map headers = response.headers;

    print(headers.toString());
    Map body = json.decode( response.bodyString );

    print(body.toString());
    flag =true;
    BasicUtils.savePreferences( PrefKeys.token ,headers['x-auth-token'] );
    BasicUtils.savePreferences(PrefKeys.refreshToken, headers['refresh-token']);
    BasicUtils.savePreferences( PrefKeys.username ,body['username'] );
    BasicUtils.savePreferences( PrefKeys.password ,headers['password'] );
    BasicUtils.savePreferences( PrefKeys.serverUniqueId ,headers['server_unique_id'] );
    BasicUtils.savePreferences( PrefKeys.clientId ,id );
    BasicUtils.savePreferences( PrefKeys.entityId ,body['entity_id'] );

    if (response.statusCode==200 && body['role']=="ADMIN"){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ManageVisitors()));
    }
    else if (response.statusCode == 200){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ManageVisitors()));
    }
    else{
      return Center(child: CircularProgressIndicator());
    }
  }
/*

  FutureBuilder<Response> buildBody(BuildContext context,
      String username,String password, String id ) {
    Map<String , String> map = {"client_id": id};
    String credentials = username + ":" + password;
    String auth = "Basic " + base64.encode( utf8.encode( credentials ) );
    print( "$map,$auth,$username,$password" );

    return FutureBuilder<Response>(
      future: Provider.of<AllApi>( context ).login(auth ,map ,"application/json" ),
      builder: (context ,snapshot){
        print( "$map,$auth,$username,$password" );
        if (snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            print("fdgdrgreg");
          }
          Map headers = snapshot.data.headers;
          Map body = json.decode( snapshot.data.bodyString );
          print(body);
          BasicUtils.savePreferences( PrefKeys.token ,headers['x-auth-token'] );
          BasicUtils.savePreferences(PrefKeys.refreshToken, headers['refresh-token']);
          BasicUtils.savePreferences( PrefKeys.username ,body['username'] );
          BasicUtils.savePreferences( PrefKeys.password ,headers['password'] );
          BasicUtils.savePreferences( PrefKeys.serverUniqueId ,headers['server_unique_id'] );
          BasicUtils.savePreferences( PrefKeys.clientId ,id );
          BasicUtils.savePreferences( PrefKeys.entityId ,body['entity_id'] );
          return navigateTo();
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      } ,
    );}

  navigateTo(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => YesNo()));
  }

  getId(BuildContext context, String username,String password)async{
    String id= await BasicUtils.getDeviceId();
    print("GET ID.............$id");
    buildBody(context , username , password , id);
  }*/

}






