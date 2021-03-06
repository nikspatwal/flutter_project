import 'dart:convert';
import 'dart:typed_data';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  List visitor=new List<dynamic>();
  String visitorId;
  String visitorHistoryId;
  List<Uint8List> img = List<Uint8List>();
  String base64;
  Uint8List image;
  Widget place;
  int total;
  DateTime date;
  List dates;


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
      total = visitor.length;
      print("SECOND     ${visitor[2]}");

      for (int i = 0; i < visitor.length; i++) {
        visitorId = visitor[i]['visitor_id'];
        visitorHistoryId = visitor[i]['visitor_history_id'];
         /*date = DateTime.fromMillisecondsSinceEpoch(visitor[i]['in_time']);
         var format =DateFormat.yMEd().add_jms().format(DateTime.fromMillisecondsSinceEpoch(visitor[i]['in_time']));
         dates.add(format);*/

        Response body = await Provider.of<AllApi>(context)
            .getVisitorImage(
            entityId, visitorId, visitorHistoryId, "multipart/form-data",
            xToken);
        var base64 = base64Encode(body.bodyBytes);
        image = base64Decode(base64);
        img.add(image);


        print("IMAGE IS $i AND $img");

      }

      setState(() {
        place=getCard(context);
      });
      print("THE VISITOR DATA IS>>>>....  $visitor");



    }
    print("LIST TOTAL IS $total");
    print("IMAGE TOTAL IS ${img.length}");

  }


  @override
  void initState() {
    super.initState();
    this.visitorHistoryApi();
  }

  



  Widget getCard(BuildContext context){
    return ListView.builder(
        itemCount: visitor.length,
        itemBuilder: (BuildContext context,i){
          return Card(child: ListTile(
              title: Text("${visitor[i]['first_name']}  ${visitor[i]['last_name']}",
              style: TextStyle(fontSize: 14.0),),
              subtitle: Text(visitor[i]['mobile_no'],style: TextStyle(fontSize: 10.0),),
              leading: (img[i].length>0)?Image.memory(img[i],
                fit: BoxFit.contain,):CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(visitor[i]['first_name'][0],
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  )),
            ),
              trailing: Text(
                  DateFormat.yMEd().add_jms().format(
                      DateTime.fromMillisecondsSinceEpoch(
                          visitor[i]['in_time'])),
                style: TextStyle(fontSize: 10.0),
              ),)
          );

        });
  }


  @override
  Widget build(BuildContext context) {
    if(visitor.length==0) {
      place= Center(
        child: CircularProgressIndicator(),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor History"),),
      body: place,


    );
  }

}


