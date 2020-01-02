import 'dart:convert';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/JsonKeys.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/screens/HomePage.dart';
import 'package:vinnoba/screens/Test2.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';

class DisplayPictureScreen extends StatefulWidget{
  final File image;
  Map sendBody;
  DisplayPictureScreen(this.image,this.sendBody);
  @override
  DisplayPictureScreenState createState() =>DisplayPictureScreenState(image,sendBody);
}


class DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final File image;
  Map body;
  DisplayPictureScreenState(this.image,this.body);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column( children: <Widget>[
        Expanded(child: Container(child: Image.file(image,fit: BoxFit.cover,
        ),)),

        Row(
          children: <Widget>[
            Container(padding: EdgeInsets.only(top: 20.0,bottom: 10.0,
                left: 30.0,right: 10.0),

              child: ButtonTheme(minWidth: 150.0,height: 40.0,
                buttonColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child:RaisedButton(
                    elevation:2.0,
                    color: Colors.black,
                    child:Text("YES",style: TextStyle(color: Colors.white,
                    ),
                      textScaleFactor: 1.2,) ,
                    onPressed: () => insertVisitorApi()

                ),
              ),),


            Padding(padding:
            EdgeInsets.only(top: 20.0,bottom: 10.0,left: 10.0,right: 10.0),
              child:ButtonTheme(minWidth: 150.0,height: 40.0,
                buttonColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: RaisedButton(
                    elevation:2.0,
                    color: Colors.black,

                    child:Text("NO",style: TextStyle(color: Colors.white,
                    ),textScaleFactor: 1.2,) ,
                    onPressed:() =>Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Test2()),
                    )),
              ),)
          ],
        )
      ],

          )




    );
  }
  
  insertVisitorApi()async{
    String visitorId = await BasicUtils.getPreferences(JsonKeys.visitorId);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String gateId = await BasicUtils.getPreferences(JsonKeys.gateId);
    print(body);

    Map map = {
      "co_visitor": {
        "co_visitor_count":0
      },

      "entry_gate_id": gateId,
      "additional_fields":{
        "room_no":0,
        "age": 0
      }

    };

    Response data = await Provider.of<AllApi>(context)
    .insertVisitor(entityId, visitorId, xToken, body);
    //Map one = json.decode(data.toString());
    print("HURRAYYY!!.....  ");
    if(data.statusCode==200){
      Response res = await Provider.of<AllApi>(context)
          .logVisitorHistory(
          entityId, visitorId, "application/json", "application/json", xToken, map);
      print("RESPONSE----------------${res.bodyString}");
      if(res.statusCode==200){
        Map response = json.decode(res.bodyString);
        BasicUtils.savePreferences( JsonKeys.visitorHistoryId ,response['visitor_history_id'] );
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
      }

    }

  }
}
