import 'dart:convert';
import 'dart:typed_data';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';

class User extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserState();
  }
}

class UserState extends State<User>{

  List user=new List<dynamic>();
  String userId;
  String userHistoryId;
  List<Uint8List> img = List<Uint8List>();
  String base64;
  Uint8List image;
  Widget place;
  int total;
  DateTime date;
  List dates;


  getUserDetailsApi() async {
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Map body = {"entity_id": entityId};
    print("user");
    Response response = await Provider.of<AllApi>(context)
        .getUserDetails(entityId, "application/json", "application/json", xToken, body);
    if (response.statusCode == 200)  {
      List data = json.decode(response.bodyString);
      user = data;
      print("DATA IS ......    $user");
      total = user.length;


      setState(() {

      });




    }

  }


  @override
  void initState() {
    super.initState();
    this.getUserDetailsApi();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("User History"),),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (BuildContext context,i){
            return Card(child: ListTile(
              title: (user[i]['last_name'] != null)?Text("${user[i]['first_name']}  ${user[i]['last_name']}",
                 style: TextStyle(fontSize: 14.0),):
              Text("${user[i]['first_name']}",
                style: TextStyle(fontSize: 14.0),),
              subtitle: Text(user[i]['mobile_no'],style: TextStyle(fontSize: 10.0),),
              leading:
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(user[i]['first_name'][0],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    )),
              ),
              trailing: Text(
                DateFormat.yMEd().add_jms().format(
                    DateTime.fromMillisecondsSinceEpoch(
                        user[i]['create_time'])),
                style: TextStyle(fontSize: 10.0),
              ),)
            );

          })


    );
  }
}



