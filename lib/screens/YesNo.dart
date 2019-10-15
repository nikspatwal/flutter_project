import 'package:flutter/material.dart';
import 'package:vinnoba/screens/HomePage.dart';
import 'package:vinnoba/screens/SeconeHomePage.dart';

class YesNo extends StatefulWidget{
   @override
   State<StatefulWidget> createState() {
     return YesNoState();
   }
}

 class YesNoState extends State<YesNo>{
   @override
   Widget build(BuildContext context) {

     return Scaffold(
       backgroundColor: Colors.white,
       body: Column(
         children: <Widget>[

          Expanded(child: Padding(padding: EdgeInsets.only(
              top: 50.0,bottom: 50.0,right: 20.0),
            child: Image.asset('assets/images/building1.jpg',fit: BoxFit.fill,

              /*alignment: Alignment.topCenter,*/),
          )),

          Expanded(child: Container(

            alignment: Alignment.bottomCenter,
            child:Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 2.0,bottom: 10.0),
                child: Image.asset('assets/images/visitor.png'),
              ),


              Center(
                  child: Padding(padding:
                  EdgeInsets.only(top: 2.0, bottom: 2.0),
                    child: Text("DO YOU WANT TO LOGIN FOR WORK",
                      textScaleFactor: 1.5,style:
                      TextStyle( color: Colors.black ,
                      ),),)),

              Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
                child: ButtonTheme(minWidth: 300.0,height: 40.0,
                  buttonColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child:RaisedButton(
                      elevation:2.0,
                      color: Colors.black,
                      child:Text("YES",style: TextStyle(color: Colors.white,
                          ),
                      textScaleFactor: 1.2,) ,
                      onPressed: (){
                        /*Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>HomePage()
                        )
                        );*/
                      }),
                ),),


              Padding(padding:
              EdgeInsets.only(top: 2.0,bottom: 2.0),
                child:ButtonTheme(minWidth: 300.0,height: 40.0,
                  buttonColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: RaisedButton(
                      elevation:2.0,
                      color: Colors.black,

                      child:Text("NO",style: TextStyle(color: Colors.white,
                          ),textScaleFactor: 1.2,) ,
                      onPressed:(){
                        /*Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>SecondHomePage()
                        )
                        );*/
                      }),
                ),)

            ],) ,))

     
         ],
       ),
     );
     
   }
   
/* Widget picture(){
     AssetImage assetImage =AssetImage("assets/images/building1.jpg");
     Image image = Image(image: assetImage,fit: BoxFit.contain,
     width: 500.0,
     height: 500.0, );

     return Container(
       padding: EdgeInsets.only(top:20.0,left: 20.0,right: 20.0),
       alignment: Alignment.topCenter,
       child: Center(
         child: image
       ),
     );

   }*/

 
    
   }
 




