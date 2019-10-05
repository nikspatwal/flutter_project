import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/screens/login_page.dart';

import 'data/api_user_session.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Provider(
        builder: (_) => UserSession.create(),
    dispose: (_, UserSession service) => service.client.dispose(),
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: Login(),
    )
    );
  }

}





