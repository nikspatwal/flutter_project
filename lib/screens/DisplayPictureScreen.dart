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
      body: Container(
        child: Image.file(File(imagePath)
        ),
      )


    );
  }
}
