import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as prefix0;
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
  visitorHistoryApi() async{
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Map body = {"entity_id": entityId};
    Response response = await Provider.of<AllApi>(context)
        .visitorHistory(entityId, xToken, "application/json", "application/json", body);

    setState(() {
      Map data= json.decode(response.bodyString);
      print("HERE COMES THE DATA>>>>>>>>>>>");
      visitor= data['data'];
      visitorId = data['data'][0]['visitor_id'];
      visitorHistoryId = data['data'][0]['visitor_history_id'];
      print(" VISITOR ID IS $visitorId ");
      print(" VISITOR  HISTORY ID IS $visitorHistoryId ");
    });
  }


   visitorImageApi() async{
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    print("HIT IT");
    Multipart response = (await Provider.of<AllApi>(context)
        .getVisitorImage(entityId, visitorId, visitorHistoryId, xToken)) as Multipart;

    setState(() {
      Map  body= json.decode(response.toString());
      print(" THE IMAGE DATA IS    ");
      print(body);
    });
  }

  @override
  void initState() {
    super.initState();
    this.visitorHistoryApi();
    this.visitorImageApi();
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
          ));
          })
    );
  }

}


