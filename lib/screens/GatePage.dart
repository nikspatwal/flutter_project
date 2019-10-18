import 'package:flutter/material.dart';
import 'package:vinnoba/screens/HomePage.dart';

class GatePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GatePageState();
  }
}

class GatePageState extends State<GatePage>{

  TextEditingController mobileNoController = TextEditingController();

  static List<String> gates=["Select Value","Main Gate 1","Main Gate 2","Main Gate 3","Main Gate 4"];
  var dropdownValue = gates[0];




  @override
  Widget build(BuildContext context){

  return Scaffold(
        appBar: AppBar( title: Text( "Manage Visitors" ) ,
          backgroundColor: Colors.lightBlueAccent , ) ,
        backgroundColor: Colors.white ,
        body: SingleChildScrollView(
          child:  Column(
            children: <Widget>[

              Padding(padding: EdgeInsets.only(
                  top: 40.0,bottom: 30.0,right: 20.0),
                child: Image.asset('assets/images/building1.jpg',fit: BoxFit.fill,

                  /*alignment: Alignment.topCenter,*/),
              ),

              Container(

                alignment: Alignment.bottomCenter,
                child:Column(children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 2.0,bottom: 10.0),
                    child: Image.asset('assets/images/visitor.png'),
                  ),

                  Container(

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
                              value: dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 16,

                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: gates
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )

                        )),
                  ),



                  Padding(padding:
                  EdgeInsets.only(top: 50.0,bottom: 5.0),
                    child:ButtonTheme(minWidth: 300.0,height: 50.0,
                      buttonColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: RaisedButton(
                          elevation:2.0,
                          color: Colors.black,

                          child:Text("NEXT",style: TextStyle(color: Colors.white,
                          ),textScaleFactor: 1.2,) ,
                          onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
                      ),
                    ),)

                ],) ,)


            ],
          ),
        )


  );


  }

/*  void _onDropDown(String newValue) {
    setState(() {
      this.currentValue = newValue;
    });
  }*/

}