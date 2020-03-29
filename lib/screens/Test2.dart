import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'DisplayPictureScreen.dart';


class Test2 extends StatefulWidget {
  final Map jsonData;

  Test2({Key key, this.jsonData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Test2State(jsonData);
  }
}

class Test2State extends State<Test2> {
  Map subField;
  String type;
  String jsonKey;
  String displayKey;
  String keypad;
  List addFields;
  Map jsonData;
  int dynamicRadioValue = 0;
  Map sendBody;

  Test2State(this.jsonData);

  TextEditingController nameController = TextEditingController();
  int radioValue = 0;
  List dynamicList = [];

  File image;

  Future getCam(context) async {
    try{
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() async {
      image = pic;

      print(image.path);
      sendBody = createMap(radioValue);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(image,sendBody)));
    });
        }catch (e) {
      print(e);
    }

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
      subField = addFields[i];
      type = subField['type'];

      switch (type) {
        case 'TEXT':
          {
            dynamicList.add(TextFieldWidget(subField: subField));
            break;
          }

        case 'DROPDOWN':
          {
            dynamicList.add(DropDownWidget(subField: subField));
            break;
          }

        case 'RADIOBUTTON':
          {
            dynamicList.add(RadioButtonWidget(subField: subField));
            break;
          }

        /*case 'CALENDAR': {
          dynamicList.add(CalendarWidget(subField: subField));
          break;
        }*/

        default:
          break;
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
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0,right: 12.0,left: 12.0),
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
                            onChanged: (int i){
                              setState(() {
                                radioValue = i;

                              });
                            }
                          ),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 16.0),
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
                            style: TextStyle(fontSize: 16.0),
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
                            style: TextStyle(fontSize: 16.0),
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
                  itemBuilder: (_, index) => dynamicList[index]),

              Container(alignment: Alignment.bottomCenter,

                  padding: EdgeInsets.all(10.0),
                  child: ButtonTheme(
                    minWidth: 300.0,
                    height: 50.0,
                    buttonColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: RaisedButton(
                        elevation: 2.0,
                        color: Colors.black,

                        child: Text(
                          "NEXT", style: TextStyle(color: Colors.white,
                        ), textScaleFactor: 1.2,),
                        onPressed: () => getCam(context)
                      /*Navigator.push(context, MaterialPageRoute(builder: (context) =>  cameraCaptureOne()))*/
                    ),
                  ))
            ],
          ),
        ));
  }

   createMap(radioValue) {
    String gender = "U";
    if (radioValue==1){
      gender = "M";
    }
    else if(radioValue==2){
      gender = "F";
    }
    else {
      gender = "O";
    }

    List name = nameController.text.toString().split(" ");
    print("NAME IS   ...... $name");
    //int n = name.length;
    sendBody = {
      "first_name" : name[0],
      "last_name" : name[1],
      "gender" : gender
    };

    print(sendBody);

    return sendBody;
  }
}

class TextFieldWidget extends StatefulWidget {
  final Map subField;

  TextFieldWidget({Key key, this.subField}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldWidgetState(subField);
  }
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  Map subField;
  TextEditingController textController = TextEditingController();

  TextFieldWidgetState(this.subField);

  @override
  Widget build(BuildContext context) {

    var type=null;
    if(subField["rule"]=="Alphanumeric"){
      type=TextInputType.text;
    }else if(subField["rule"]=="Numeric"){
      type=TextInputType.number;
    }


    return Container(
      margin: EdgeInsets.all(12.0),
      child: TextField(
        controller: textController,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: subField['display_key'].toString(),
        ),
      ),
    );
  }
}

class RadioButtonWidget extends StatefulWidget {
  final Map subField;

  RadioButtonWidget({Key key, this.subField}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RadioButtonWidgetState(subField);
  }
}

class RadioButtonWidgetState extends State<RadioButtonWidget> {
  int n;
  Map subField;

  RadioButtonWidgetState(this.subField);

  int dynamicRadioValue = -1;
  String currText = "";
  List<dynamic> items = [];

  radioRun() {
    items = subField['values'];
    n = items.length;
  }


  @override
  void initState() {
    this.radioRun();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Text(
        subField['display_key'],
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
      ),

        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: n,
          itemBuilder: (context, index) {

            return RadioListTile(
              value: index,
              groupValue: dynamicRadioValue,
              onChanged: (ind) => setState(() => dynamicRadioValue = ind),
              title: Text(items[index]),
            );
          },
            )
                /*(int i) => RadioListTile
                  (title:Text(items[i].toString())                  ,
                  value: i,
                    groupValue: dynamicRadioValue,
                    onChanged: (int value){
                      setState(() {
                        dynamicRadioValue = value;
                        currText = i.toString();
                      });
                    },)*//*<int>(
              value: i,
              groupValue: dynamicRadioValue,
              onChanged: (int value){
                setState(() {
                  dynamicRadioValue = value;
                });
              },
            ),*/
          



    ],)

    );
    }
  }


  class DropDownWidget extends StatefulWidget{
  final Map subField;
  DropDownWidget({Key key , this.subField}) : super(key : key);
  @override
  State<StatefulWidget> createState() {
  return DropDownWidgetState(subField);
  }
  }

  class DropDownWidgetState extends State<DropDownWidget> {
  Map subField;
  DropDownWidgetState(this.subField);
  List<String> menu = List<String>();
  String dropdownValue;
  List subMenu;
  int n;
  TextEditingController textController = TextEditingController();

  dropdownRun(){
    subMenu = subField['values'];
    n=subMenu.length;
    for (int i=0;i<n;i++){
      menu.add(subField['values'][i]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.dropdownRun();
  }

  @override
  Widget build(BuildContext context) {
  return Container(
  margin: EdgeInsets.all(12.0),
  child: Container(

  width: 200.0,
  height: 50,
  decoration: ShapeDecoration(
  shape: RoundedRectangleBorder(
  side: BorderSide(width: 1.0, style: BorderStyle.solid),
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  ),
  child: DropdownButtonHideUnderline(
  child: ButtonTheme(
  alignedDropdown: true,
  child: DropdownButton<String>(
    hint: Text("Select"),
  value: dropdownValue,
  icon: Icon(Icons.keyboard_arrow_down),
  iconSize: 24,
  elevation: 16,

  onChanged: (String newValue) {
  setState(() {
  dropdownValue = newValue;

  });
  },
  items: menu.map((item) {
  return DropdownMenuItem<String>(
  value: item,
  child: Text(item)
  );
  }).toList(),
  )

  )),
  ),
  );
  }
  }


/*
class CalendarWidget extends StatefulWidget{
  Map subField;

  CalendarWidget({Key key , this.subField}) : super(key : key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalendarWidgetState(subField);
  }
}

class CalendarWidgetState extends State<CalendarWidget> {
  Map subField;
  final dateFormat = DateFormat;
  DateTime date;
  TimeOfDay time;

  CalendarWidgetState(this.subField);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: DateTimePickerFormField(
        format: dateFormat,
        decoration: InputDecoration(labelText: 'Date'),
        onChanged: (dt) => setState(() => date = dt),
      ),)
*/
