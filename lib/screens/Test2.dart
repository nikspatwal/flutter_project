import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Test2 extends StatefulWidget {
  final Map jsonData;

  Test2({Key key, this.jsonData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Test2State(jsonData);
  }
}

class Test2State extends State<Test2> {
  String type;
  String jsonKey;
  String displayKey;
  String keypad;
  List addFields;
  Map jsonData;
  int dynamicRadioValue = 0;

  Test2State(this.jsonData);

  TextEditingController nameController = TextEditingController();
  int radioValue = 0;
  List dynamicList = [];

  File image;

  Future getCam() async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() async {
      image = pic;
      final imagePath =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      print(imagePath);
    });
  }

  impText(int i) {
    jsonKey = addFields[i]['json_key'];
    displayKey = addFields[i]['display_key'];
    keypad = addFields[i]['rule'];
  }

  run() {
    print("NEXT PAGE VALA OUTPUT");
    print(jsonData['additional_fields']);
    addFields = jsonData['additional_fields'];
    int n = addFields.length;
    for (int i = 0; i < n; i++) {
      type = addFields[i]['type'];

      switch(type){

        case 'TEXT': {
          dynamicList.add(TextFieldWidget());
          break;
        }

        case 'DROPDOWN': {
          dynamicList.add(DropDownWidget());
          break;
        }

        case 'RADIOBUTTON': {
          dynamicList.add(RadioButtonWidget());
          break;
        }

        case 'CALENDAR': {
          dynamicList.add(CalendarWidget());
          break;
        }

        default: break;

      }
    }
  }

  @override
  void initState() {
    super.initState();
    this.run();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Manage Visitors"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        decoration: TextDecoration.none),
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter mobile no.";
                      }
                      return null;
                    }),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    top: 30.0, bottom: 20.0, left: 10.0, right: 10.0),
                child: Text(
                  "Gender",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 10.0),
                        child: Image.asset(
                          'assets/images/male.png',
                          height: 64,
                          width: 90,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (int i) =>
                                setState(() => radioValue = i),
                          ),
                          Text(
                            "Male",
                            style:   TextStyle(fontSize: 16.0),
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 10.0),
                        child: Image.asset(
                          'assets/images/femalecropped.png',
                          height: 64,
                          width: 90,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (int i) =>
                                setState(() => radioValue = i),
                          ),
                          Text(
                            "Female",
                            style:   TextStyle(fontSize: 16.0),
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 10.0),
                        child: Image.asset(
                          'assets/images/other.png',
                          height: 64,
                          width: 90,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 3,
                            groupValue: radioValue,
                            onChanged: (int i) =>
                                setState(() => radioValue = i),
                          ),
                          Text(
                            "Other",
                            style:   TextStyle(fontSize: 16.0),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                  itemCount: dynamicList.length,
                  itemBuilder: (_,index) => dynamicList[index]),

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
            ],
          ),
        ));
  }
}

class TextFieldWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldWidgetState();
  }
}

class TextFieldWidgetState extends State {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: " Enter Data ",
        ),
      ),
    );
  }
}



class RadioButtonWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return RadioButtonWidgetState();
  }
}

class RadioButtonWidgetState extends State<RadioButtonWidget> {
  int dynamicRadioValue = 0;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Text("Decide",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: dynamicRadioValue,
              onChanged: (int i) => setState(() => dynamicRadioValue = i),
            ),
            Text(
              'One',
              style:TextStyle(fontSize: 16.0),
            ),
            Radio(
                value: 1,
                groupValue: dynamicRadioValue,
                onChanged: (int i) => setState(() => dynamicRadioValue = i)
            ),
            Text(
              'Two',
              style:   TextStyle(
                fontSize: 16.0,
              ),
            ),
            Radio(
                value: 2,
                groupValue: dynamicRadioValue,
                onChanged: (int i) => setState(() => dynamicRadioValue = i)

            ),
            Text(
              'Three',
              style:   TextStyle(fontSize: 16.0),
            ),
          ],
        ) ],)

    );
  }
}


class DropDownWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DropDownWidgetState();
  }
}

class DropDownWidgetState extends State<DropDownWidget> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: " Enter Data ",
        ),
      ),
    );
  }
}



class CalendarWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalendarWidgetState();
  }
}

class CalendarWidgetState extends State<CalendarWidget> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: " Enter Data ",
        ),
      ),
    );
  }
}
