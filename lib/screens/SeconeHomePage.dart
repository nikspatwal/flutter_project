import 'package:flutter/material.dart';

class SecondHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(
      ) {
    return SecondHomePageState( );
  }
}

class SecondHomePageState extends State<SecondHomePage> {
  @override
  Widget build(
      BuildContext context
      ) {
    return Scaffold(
      appBar: AppBar( title: Text( "Manage Visitors" ) ,
        backgroundColor: Colors.lightBlueAccent , ) ,
      backgroundColor: Colors.white ,
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
                        onPressed:null),
                  ),

                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(7.0),
                    child: RaisedButton(
                        elevation:2.0,
                        color: Colors.lightBlueAccent,
                        child:Text("VISITORS",style: TextStyle(color: Colors.white, )
                          ,textScaleFactor: 1.3,) ,
                        onPressed:null),
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