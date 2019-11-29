import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/JsonKeys.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/screens/Camtry.dart';
import 'package:vinnoba/screens/Test.dart';

import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';


class NewVisitorOne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NewVisitorOneState();
  }
}

class NewVisitorOneState extends State<NewVisitorOne>{
  TextEditingController mobileNoController = TextEditingController();
  Map body;
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

                Center(
                    child: Padding(padding:
                    EdgeInsets.only(top: 2.0, bottom: 2.0),
                      child: Text("Please Enter Mobile Number ",
                        textScaleFactor: 1.5,style:
                        TextStyle( color: Colors.black ,
                        ),),)),

                Container(
                  margin: EdgeInsets.only(left: 50.0,right: 50.0),
                  child: Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                      controller: mobileNoController ,
                      style: TextStyle(
                          color: Colors.black ,
                          fontSize: 17.0 ,
                          decoration: TextDecoration.none ) ,
                      decoration: InputDecoration(

                        hintText: "10 digit mobile no." ,
                        hintStyle: TextStyle(
                          color: Colors.grey ,),
                        errorStyle: TextStyle( color: Colors.red ) ,
                      ) ,
                      validator: (
                          String value
                          ) {
                        if(value.isEmpty){
                          return "Please enter mobile no.";
                        }
                        return null;
                      } ) ,),),



                Padding(padding:
                EdgeInsets.only(top: 5.0,bottom: 5.0),
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
                          String mobile = mobileNoController.text.toString();
                          registerVisitorApi(context, mobile);

                        }
                    ),
                  ),)

              ],) ,)


          ],
        ),
      )



    );

  }
  registerVisitorApi(
      BuildContext context ,String mobile ) async {
    Map mobileNo = {"mobile_no": mobile};
    print(mobileNo);
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    print(entityId);
    Response data = await Provider.of<AllApi>( context ).
    registerVisitor(entityId, xToken, "application/json", "application/json", mobileNo);
    Map headers = data.headers;
    print(headers.toString());
     body = json.decode( data.bodyString );
    BasicUtils.savePreferences( JsonKeys.visitorId ,body['visitor_id']);
    print("BODY...........");
    print(body.toString());
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            Test(jsonData: body)));


  }




}