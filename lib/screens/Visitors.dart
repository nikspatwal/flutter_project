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
  visitorHistoryApi() async{
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Map body = {"entity_id": entityId};
    Response response = await Provider.of<AllApi>(context)
        .visitorHistory(entityId, xToken, "application/json", "application/json", body);

    setState(() {
      Map data= json.decode(response.bodyString);
      print(data.toString());
      List visitor= data['data'];
      print(visitor);
    });
  }

  @override
  void initState() {
    super.initState();
    this.visitorHistoryApi();
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor History"),),
      body: Center(

      ),
    );
  }

}


