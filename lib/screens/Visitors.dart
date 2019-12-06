import 'dart:convert';
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
  List img;





  visitorHistoryApi() async {
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Map body = {"entity_id": entityId};
    print("VISITOR");
    Response response = await Provider.of<AllApi>(context)
        .visitorHistory(
        entityId, xToken, "application/json", "application/json", body);
    if (response.statusCode == 200) {
      Map data = json.decode(response.bodyString);
      visitor = data['data'];
      for (int i = 0; i < visitor.length; i++) {
        visitorId = visitor[i]['visitor_id'];
        visitorHistoryId = visitor[i]['visitor_history_id'];

        Response body = await Provider.of<AllApi>(context)
            .getVisitorImage(
            entityId, visitorId, visitorHistoryId, "multipart/form-data",
            xToken);
        /*List img = jsonDecode(body.bodyBytes.toString());
        print("IMAGE IS $i AND $img");*/

        var img = body.bodyBytes.toString();
        print("IMAGE IS $i AND $img");
        setState(() {
          visitor = data['data'];
           img = body.bodyBytes.toString();
          print("HERE COMES THE DATA>>>>>>>>>>>");
        });
      }
    }

  }

/*
    Future visitorImageApi() async{
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    print("HIT THE IMAGE API");
    visitorId="e0f190b1-1089-4da2-bc6d-ee81537dc3d6";
    visitorHistoryId= "ab27d614-7dbf-466a-8886-d88dce03dd03";
    Response response = await Provider.of<AllApi>(context)
        .getVisitorImage(entityId, visitorId, visitorHistoryId, "multipart/form-data", xToken) ;
    List body = jsonDecode(response.toString());
      print("MULTIPART RESPONSE... $body");

*/
/*    setState(() {
      Map  body= json.decode(response.toString());
      print(" THE IMAGE DATA IS    ");
      print(body);
    });*//*

  }
*/

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
            /*leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text("${visitor[i]['first_name'][]}  ${visitor[i]['last_name'][1]}",
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


