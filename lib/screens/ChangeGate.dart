import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/JsonKeys.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/screens/HomePage.dart';
import 'package:vinnoba/utils/ApiUtils.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';

class ChangeGate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangeGateState();
  }
}

class ChangeGateState extends State<ChangeGate>{
  List<String> gates= List<String>();
  String dropdownValue ;
  List response=[];
  int n=0;

  gateQueryApi(dropdownValue) async {

    Map body = {};
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Response data = await Provider.of<AllApi>( context ).
    gateQuery(xToken, entityId, body);

    print("REFRESH 5 ");

    if(data.statusCode == 200){

      response = json.decode( data.bodyString );
      n= response.length;
      print(n);
      print(response[0]['gate_name'].toString());

      setState(() {
        for(int i=0;i<n;i++){
          gates.add(response[i]['gate_name'].toString());
        }
        dropdownValue=gates[0];
      });
    }
    else if(data.statusCode == 401)  {
      int code = await ApiUtils.refreshTokenApi(context);
      if( code == 200){
        print("REFRESH 4 ");
        gateQueryApi(dropdownValue);
      }
    }

  }

  @override
  void initState() {
    super.initState();
    gateQueryApi(dropdownValue);
  }
  @override
  Widget build(BuildContext context) {
    if(gates.length == 0){
      return Scaffold(
        appBar: AppBar( title: Text( "Manage Visitors" ) ,
          backgroundColor: Colors.lightBlueAccent , ) ,
        body: Center(
          child: CircularProgressIndicator(),
        ) ,
      );

    }

    return Scaffold(
        appBar: AppBar( title: Text( "Manage Visitors" ) ,
          backgroundColor: Colors.lightBlueAccent , ) ,
        backgroundColor: Colors.white ,
        body:  SingleChildScrollView(
          child:  Column(
            children: <Widget>[

              Padding(padding: EdgeInsets.only(
                  top: 40.0,bottom: 30.0,right: 20.0),
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

                    width: 200.0,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              hint: Text("Select"),
                              value: dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 16,

                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: gates.map((item) {
                                return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item)
                                );
                              }).toList(),
                            )

                        )),
                  ),



                  Padding(padding:
                  EdgeInsets.only(top: 50.0,bottom: 5.0),
                    child:ButtonTheme(minWidth: 300.0,height: 50.0,
                      buttonColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: RaisedButton(
                          elevation:2.0,
                          color: Colors.black,

                          child:Text("NEXT",style: TextStyle(color: Colors.white,
                          ),textScaleFactor: 1.2,) ,
                          onPressed:() {
                            save( context,response,gates,dropdownValue,n);


                          }
                      ),
                    ),)

                ],) ,)


            ],
          ),
        )
    );
  }
}


save(BuildContext context,response,gates,dropdownValue,n){
  int pos=0;
  for (int i=0; i<n;i++){
    if(dropdownValue==gates[i]){
      pos=i;
      break;
    }
  }
  BasicUtils.savePreferences(JsonKeys.gateId, response[pos]["gate_id"]);
  BasicUtils.savePreferences(JsonKeys.gateName, response[pos]["gate_name"]);
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()));
}



