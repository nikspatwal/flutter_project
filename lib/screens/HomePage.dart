import 'package:flutter/material.dart';

import 'package:vinnoba/screens/NewVisitorOne.dart';
import 'package:vinnoba/screens/Social.dart';
import 'package:vinnoba/screens/Visitors.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(
      ) {
    return HomePageState( );
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(
      BuildContext context
      ) {
    return Scaffold(
      appBar: AppBar( title: Text( "Manage Visitors" ) ,
        backgroundColor: Colors.lightBlueAccent , ) ,

      backgroundColor: Colors.white ,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Social"),
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) => Social())),
            ),
          ],
        ),
      ),
      body: Column(
          children: <Widget>[

        Expanded( child: Padding( padding: EdgeInsets.only(
            top: 50.0 ,bottom: 30.0 ,right: 20.0 ) ,
           child: Image.asset(
                'assets/images/building1.jpg' ,fit: BoxFit.fill ,

            alignment: Alignment.topCenter, ) ,
          ) ) ,
        Container(
          color: Color(0xffeeeeee),
          child: GridView.count(
              shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            padding: EdgeInsets.all(4.0),
            children: <Widget>[
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(7.0,),
                child: RaisedButton(
                    elevation:2.0,
                    color: Colors.lightBlueAccent,
                    child:Text("NEW VISITOR",style: TextStyle(color: Colors.white, )
                      ,textScaleFactor: 1.3,) ,
                    onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => NewVisitorOne()))),
              ),

              Container(
                color: Colors.white,
                padding: EdgeInsets.all(7.0),
                child: RaisedButton(
                    elevation:2.0,
                    color: Colors.lightBlueAccent,
                    child:Text("VISITORS",style: TextStyle(color: Colors.white, )
                      ,textScaleFactor: 1.3,) ,
                    onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Visitors()))),
              ),

              Container(
                color: Colors.white,
                padding: EdgeInsets.all(7.0),
                child: RaisedButton(
                    elevation:2.0,
                    color: Colors.lightBlueAccent,
                    child:Text("WORK HISTORY",style: TextStyle(color: Colors.white, )
                      ,textScaleFactor: 1.3,) ,
                    onPressed:(){}),
              ),

              Container(
                color: Colors.white,
                padding: EdgeInsets.all(7.0),
                child: RaisedButton(
                    elevation:2.0,
                    color: Colors.lightBlueAccent,
                    child:Text("WORK LOGOUT",style: TextStyle(color: Colors.white, )
                      ,textScaleFactor: 1.3,) ,
                    onPressed:(){}),
              )
            ]
        ),)


          ] ,
      ) ,
    );
  }
}