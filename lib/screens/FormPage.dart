import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(
      ) {
    return FormPageState( );
  }
}

class FormPageState extends State<FormPage>{
  TextEditingController nameController = TextEditingController();
  int radioValue=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child:

      Scaffold(
      appBar: AppBar( title: Text( "Manage Visitors" ) ,
        backgroundColor: Colors.lightBlueAccent ,
        bottom: TabBar(
          tabs: [
            Tab(text: "Basics",),
            Tab(text: "Camera",)
          ]),) ,
        backgroundColor: Colors.white ,
      body:TabBarView(
          children: [
            first(),
            Icon(Icons.camera_alt)
          ]),

    )
    );
  }

  first(){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
          child: TextFormField(
              keyboardType: TextInputType.text,
              controller: nameController ,
              style: TextStyle(
                  color: Colors.black ,
                  fontSize: 17.0 ,
                  decoration: TextDecoration.none ) ,
              decoration: InputDecoration(

                hintText: "Name" ,
                hintStyle: TextStyle(
                  color: Colors.grey ,),
                errorStyle:  TextStyle( color: Colors.red ) ,
              ) ,
              validator: (
                  String value
                  ) {
                if(value.isEmpty){
                  return "Please enter mobile no.";
                }
                return null;
              } ) ,),

        Container(alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 30.0,bottom: 20.0,left: 10.0,right: 10.0),
          child: Text("Gender",
            textAlign: TextAlign.left,
          style: TextStyle(fontSize: 17.0,
          fontWeight: FontWeight.bold),),),



        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0,left: 10.0),
                  child: Image.asset('assets/images/male.png',height: 64,width: 90,),
                ),
                 Row(
                  children: <Widget>[
                    Radio(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: (int i) => setState(() => radioValue = i),
                    ),


                  Text(
                  "Male",
                  style: new TextStyle(fontSize: 16.0),
                  )
                  ],
                  )
                  ],
                  ),

            Container(
              width: 40.0,
            ),


            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0,left: 10.0),
                  child: Image.asset('assets/images/femalecropped.png',height: 64,width: 90,),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (int i) => setState(() => radioValue = i),
                    ),


                    Text(
                      "Female",
                      style: new TextStyle(fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),

            Container(
              width: 40.0,
            ),




            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0,left: 10.0),
                  child: Image.asset('assets/images/other.png',height: 64,width: 90,),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: radioValue,
                      onChanged: (int i) => setState(() => radioValue = i),
                    ),


                    Text(
                      "Other",
                      style: new TextStyle(fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),





      ],
    )
    ]
    );
  }
}



