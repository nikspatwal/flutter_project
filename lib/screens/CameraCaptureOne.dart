import 'package:flutter/material.dart';
import 'package:vinnoba/screens/CameraCaptureTwo.dart';


class CameraCaptureOne extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CameraCaptureOneState();
  }
}

class CameraCaptureOneState extends State<CameraCaptureOne>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(


      child: Container(alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(10.0),
        child: ButtonTheme(
          minWidth: 100.0,height: 50.0,

          buttonColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          child: RaisedButton(
            elevation:2.0,
            color: Colors.black,

            child:Text("CAPTURE",style: TextStyle(color: Colors.white,
            ),textScaleFactor: 1.2,) ,
            onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => CameraCaptureTwo()))
        ),
      ))
    );

  }
}


