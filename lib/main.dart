import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/screens/LoginPage.dart';
import 'utils/api_user_session.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Provider(
        builder: (_) => UserSession.create(),
    dispose: (__, UserSession service) => service.client.dispose(),
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: LoginPage(),
    )
    );
  }

}





