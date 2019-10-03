import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:vinnoba/screens/login_page.dart';
//import './data/post_api_service.dart';
//import 'chopperhp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: Login(),
    );
  }

}


    //Provider(
      //builder: (_) => PostApiService.create(),
      //dispose: (_, PostApiService service) => service.client.dispose(),
      //child:


