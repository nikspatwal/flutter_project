import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatefulWidget{
  final String imagePath;
  DisplayPictureScreen(this.imagePath);
  @override
  DisplayPictureScreenState createState() =>DisplayPictureScreenState(imagePath);
}


class DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final String imagePath;
  DisplayPictureScreenState(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column( children: <Widget>[
        Container(child: Image.file(File(imagePath),fit: BoxFit.cover,
        ),),

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
                    onPressed: () {}
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
                    onPressed:() {}),
              ),)
          ],
        )
      ],

          )




    );
  }
}
