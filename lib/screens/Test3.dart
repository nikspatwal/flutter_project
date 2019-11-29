import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Test3 extends StatefulWidget {
  final Map jsonData;

  Test3({Key key, this.jsonData}) : super(key: key);

  @override
  State<StatefulWidget> createState(
      ) {
    return Test3State(jsonData);
  }
}

class Test3State extends State<Test3> {
  String jsonKey;
  String displayKey;
  String keypad;
  List addFields;
  Map jsonData;

  Test3State(this.jsonData);

  TextEditingController nameController = TextEditingController();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  int radioValue = 0;
  List<TextFieldWidget> dynamicList = [];

  File image;

  Future getCam() async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() async {
      image = pic;
      final imagePath = join((await getTemporaryDirectory()).path,
          '${DateTime.now()}.png');


      print(imagePath);
    });
  }

  impText(int i) {
    jsonKey = addFields[i]['json_key'];
    displayKey = addFields[i]['display_key'];
    keypad = addFields[i]['rule'];
    dynamicList.add(TextFieldWidget());
  }

  run() {
    print("NEXT PAGE VALA OUTPUT");
    print(jsonData['additional_fields']);
    addFields = jsonData['additional_fields'];
    int n = addFields.length;
    for (int i = 0; i < n; i++) {
      if (addFields[i]['type'] == 'TEXT') {
        impText(i);
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
        appBar: AppBar(title: Text("Manage Visitors"),
          backgroundColor: Colors.lightBlueAccent,),
        body: Column(children: <Widget>[
          FormBuilder(
            key: formKey,
            child: Column(
              children: <Widget>[
              FormBuilderTextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                  attribute: "Age",
                  decoration: InputDecoration(labelText: "Age"),
                  validators: [
                    FormBuilderValidators.requiredTrue(errorText: "Required"),
                  ]
              ),
               /* FormBuilderCheckboxList(
                  decoration:
                  InputDecoration(labelText: "The language of my people"),
                  attribute: "languages",
                  initialValue: ["Dart"],
                  options: [
                    FormBuilderFieldOption(value: "Dart"),
                    FormBuilderFieldOption(value: "Kotlin"),
                    FormBuilderFieldOption(value: "Java"),
                    FormBuilderFieldOption(value: "Swift"),
                    FormBuilderFieldOption(value: "Objective-C"),
                  ],
                )*/
                FormBuilderRadio(
                  decoration: InputDecoration(labelText: "Gender"),
                  attribute: "Gender kya h",
                  initialValue: ["Male"],
                  options: [
                    FormBuilderFieldOption(value: "Male",
                    child: Image.asset('assets/images/male.png',),),
                    FormBuilderFieldOption(value: "Female",child: Image.asset('assets/images/femalecropped.png',),),
                    FormBuilderFieldOption(value: "Transgender",child: Image.asset('assets/images/other.png',),)
                  ],
                )

               /* ListView.builder(itemCount: dynamicList.length,
                  itemBuilder: (_, index) => dynamicList[index],)*/
              ],
            ),

          )
        ]));
  }
}

/*
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


      *//* Container(alignment: Alignment.bottomCenter,

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
              *//**//*Navigator.push(context, MaterialPageRoute(builder: (context) =>  cameraCaptureOne()))*//**//*
            ),
          ))*//*


    ]
    ));
  }

}*/

class TextFieldWidget extends StatelessWidget{

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
