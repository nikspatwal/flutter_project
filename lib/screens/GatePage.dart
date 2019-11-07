import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/JsonKeys.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/screens/HomePage.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';


class GatePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GatePageState();
  }
}

class GatePageState extends State<GatePage>{

  TextEditingController mobileNoController = TextEditingController();

  static List<String> gates=["Select Value","Main Gate 1","Main Gate 2","Main Gate 3","Main Gate 4"];
  String dropdownValue = gates[0];




  @override
  Widget build(BuildContext context){

  return Scaffold(
        appBar: AppBar( title: Text( "Manage Visitors" ) ,
          backgroundColor: Colors.lightBlueAccent , ) ,
        backgroundColor: Colors.white ,
        body: SingleChildScrollView(
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
                              value: dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 16,

                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: gates
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
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
                            gateQueryApi( dropdownValue);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => HomePage()));
                          }
                      ),
                    ),)

                ],) ,)


            ],
          ),
        )


  );


  }

/*  void _onDropDown(String newValue) {
    setState(() {
      this.currentValue = newValue;
    });
  }*/

  gateQueryApi(dropdownValue) async {

    Map body = {"gate_name": dropdownValue};
    print(body);
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    print(entityId);
    Response data = await Provider.of<AllApi>( context ).
    gateQuery(xToken, entityId, body);
    List response = json.decode( data.bodyString );
    BasicUtils.savePreferences( JsonKeys.visitorId ,body['visitor_id']);
    print("BODY...........");
    print(response[0]['gate_id'].toString());
    BasicUtils.savePreferences(JsonKeys.gateId, response[0]["gate_id"]);
    save(response);
  }


  save(response){
    for (int i=0; i<response.length;i++){
      BasicUtils.savePreferences(JsonKeys.gateId, response[i]["gate_id"]);
      BasicUtils.savePreferences(JsonKeys.gateName, response[i]["gate_name"]);
    }
  }
}