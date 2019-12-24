import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/screens/LoginPage.dart';
import 'package:vinnoba/screens/ManageVisitors.dart';
import 'package:vinnoba/screens/React.dart';
import 'package:vinnoba/screens/Social.dart';
import 'utils/api.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Provider(
        builder: (_) => AllApi.create(),
    dispose: (__, AllApi service) => service.client.dispose(),
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vinnoba",
      home: ManageVisitors(),
    )
    );
  }

}





