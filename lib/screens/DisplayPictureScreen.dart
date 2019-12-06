import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vinnoba/screens/HomePage.dart';
import 'package:vinnoba/screens/Test2.dart';

class DisplayPictureScreen extends StatefulWidget{
  final File image;
  DisplayPictureScreen(this.image);
  @override
  DisplayPictureScreenState createState() =>DisplayPictureScreenState(image);
}


class DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final File image;
  DisplayPictureScreenState(this.image);
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
                    onPressed: () =>Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                    )
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
}
