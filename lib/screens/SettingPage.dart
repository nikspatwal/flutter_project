import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar( title: Text( "Manage Visitors" ) ,
          backgroundColor: Colors.lightBlueAccent , ) ,
        backgroundColor: Colors.white ,
        body: SingleChildScrollView(
          child:  Column(
            children: <Widget>[

              Padding(padding: EdgeInsets.only(
                  top: 10.0,bottom: 10.0,right: 20.0),
                child: Image.asset('assets/images/building1.jpg',fit: BoxFit.fill,
                  /*alignment: Alignment.topCenter,*/),
              ),

              Container(

                alignment: Alignment.bottomCenter,
                child:Column(children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 2.0,bottom: 10.0),
                    child: Image.asset('assets/images/visitor.png'),
                  ),

                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(padding:
                        EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child:ButtonTheme(minWidth: 300.0,height: 50.0,
                            buttonColor: Colors.black,

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white),),
                            child: RaisedButton(
                                elevation:2.0,
                                color: Colors.black,

                                child:Text("THEME SETTING",style: TextStyle(color: Colors.white,
                                ),textScaleFactor: 1.2,) ,
                                onPressed:() => print("ONE")
                            ),
                          ),),



                        Padding(padding:
                        EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child:ButtonTheme(minWidth: 300.0,height: 50.0,
                            buttonColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                            child: RaisedButton(
                                elevation:2.0,
                                color: Colors.black,

                                child:Text("VISITOR SETTING",style: TextStyle(color: Colors.white,
                                ),textScaleFactor: 1.2,) ,
                                onPressed:() => print("TWO")
                            ),
                          ),),



                        Padding(padding:
                        EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child:ButtonTheme(minWidth: 300.0,height: 50.0,
                            buttonColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            child: RaisedButton(
                                elevation:2.0,
                                color: Colors.black,

                                child:Text("GATE SETTING",style: TextStyle(color: Colors.white,
                                ),textScaleFactor: 1.2,) ,
                                onPressed:() => print("THREE")
                            ),
                          ),),



                        Padding(padding:
                        EdgeInsets.only(top: 5.0,bottom: 5.0),
                          child:ButtonTheme(minWidth: 300.0,height: 50.0,
                            buttonColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)),
                            child: RaisedButton(
                                elevation:2.0,
                                color: Colors.black,

                                child:Text("ADDITIONAL SETTING",style: TextStyle(color: Colors.white,
                                ),textScaleFactor: 1.2,) ,
                                onPressed:() => print("FOUR")
                            ),
                          ),),
                      ],
                    ))
                ],) ,)


            ],
          ),
        )

    );
  }
}



