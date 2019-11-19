import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CamTry extends StatefulWidget {
  @override
  State<StatefulWidget> createState(
      ) {
    return CamTryState();
  }
}

class CamTryState extends State<CamTry>{
  TextEditingController nameController= TextEditingController();
  int radioValue=0;

  File image;

  Future getCam() async{
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() async{
      image = pic;
      final imagePath = join(( await getTemporaryDirectory()).path,
      '${DateTime.now()}.png');


      print(imagePath);

    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text( "Manage Visitors" ) ,
          backgroundColor: Colors.lightBlueAccent ,) ,
      body: first()
    );
  }

  first(){

    return SingleChildScrollView(child:
    Column( children: <Widget>[
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
      ),


      Container(
        width: 300.0,
        height: 300.0,
      ),

      Container(alignment: Alignment.bottomCenter,

          padding: EdgeInsets.all(10.0),
          child: ButtonTheme(
            minWidth: 300.0,height: 50.0,
            buttonColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: RaisedButton(
                elevation:2.0,
                color: Colors.black,

                child:Text("NEXT",style: TextStyle(color: Colors.white,
                ),textScaleFactor: 1.2,) ,
                onPressed:() => getCam()
              /*Navigator.push(context, MaterialPageRoute(builder: (context) =>  cameraCaptureOne()))*/
            ),
          ))


    ]
    ));




  }


}



