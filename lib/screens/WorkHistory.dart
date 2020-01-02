import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'package:vinnoba/utils/BasicUtils.dart';
import 'package:vinnoba/utils/api.dart';

class WorkHistory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WorkHistoryState();
  }
}

class WorkHistoryState extends State<WorkHistory>{

  List employee=new List<dynamic>();
  String employeeId;
  String employeeHistoryId;
  String base64;
  Widget place;
  int total;
  DateTime date;
  List dates;
  List employeeAdd = new List<dynamic>();


  employeeWorkHistoryApi(int pageNumber) async {
    String xToken = await BasicUtils.getPreferences(PrefKeys.token);
    String entityId = await BasicUtils.getPreferences(PrefKeys.entityId);
    Map body = {"entity_id": entityId,
    "page_details":{
    "page_number": pageNumber,
    "page_size":10
    }
    };
    print("employee");
    Response response = await Provider.of<AllApi>(context)
        .employeeWorkHistory(entityId, "application/json", "application/json", xToken, body);
    if (response.statusCode == 200)  {
      List data = json.decode(response.bodyString);
      employee = data;
      print("DATA IS ......    $employee");
      total = employee.length;


      setState(() {

      });




    }

  }



  @override
  void initState() {
    super.initState();
    for(int pg=1;pg)
      this.employeeWorkHistoryApi(pg);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("employee History"),),
        body: ListView.builder(
            itemCount: employee.length,
            itemBuilder: (BuildContext context,i){
              return Card(child: ListTile(
                title: (employee[i]['last_name'] != null)?Text("${employee[i]['first_name']}  ${employee[i]['last_name']}",
                  style: TextStyle(fontSize: 14.0),):
                Text("${employee[i]['first_name']}",
                  style: TextStyle(fontSize: 14.0),),
                subtitle: Text(employee[i]['mobile_no'],style: TextStyle(fontSize: 10.0),),
                leading:
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(employee[i]['first_name'][0],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      )),
                ),
                trailing: Text(
                  DateFormat.yMEd().add_jms().format(
                      DateTime.fromMillisecondsSinceEpoch(
                          employee[i]['create_time'])),
                  style: TextStyle(fontSize: 10.0),
                ),)
              );

            })


    );
  }
}
  

  
