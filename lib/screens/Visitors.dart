import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as prefix0;
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';

class Visitors extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return VisitorsState();
  }
}

class VisitorsState extends State<Visitors>{
  List visitor;
  String visitorId;
  String visitorHistoryId;
  List<Uint8List> img = List<Uint8List>();
  String base64;
  Uint8List image;


  visitorHistoryApi() async {
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Map body = {"entity_id": entityId};
    print("VISITOR");
    Response response = await Provider.of<AllApi>(context)
        .visitorHistory(
        entityId, xToken, "application/json", "application/json", body);
    if (response.statusCode == 200)  {
      Map data = json.decode(response.bodyString);

      visitor = data['data'];
      for (int i = 0; i < visitor.length; i++) {
        visitorId = visitor[i]['visitor_id'];
        visitorHistoryId = visitor[i]['visitor_history_id'];

        Response body = await Provider.of<AllApi>(context)
            .getVisitorImage(
            entityId, visitorId, visitorHistoryId, "multipart/form-data",
            xToken);
        var base64 = base64Encode(body.bodyBytes);
        image = base64Decode(base64);
        img.add(image);


        print("IMAGE IS $i AND $img");
        setState(() {

        });
      }
    }

  }


  @override
  void initState() {
    super.initState();
    this.visitorHistoryApi();
    /*this.visitorImageApi();*/
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor History"),),
      body: ListView.builder(
        itemCount: visitor==null? 0 : visitor.length,
          itemBuilder: (BuildContext context,i){


            return Card(child: ListTile(
                title: Text("${visitor[i]['first_name']}  ${visitor[i]['last_name']}"),
                subtitle: Text(" Mobile no: ${visitor[i]['mobile_no']}"),
                leading: Image.memory(img[i],
                  fit: BoxFit.contain,) /*CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(visitor[i]['first_name'][0],
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
            ),*/
            ));





          })
    );
  }

}


