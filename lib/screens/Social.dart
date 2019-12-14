import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Social extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocialState();
  }
}

class SocialState extends State<Social>{

  TextEditingController textController = TextEditingController();
  createPost(){

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/1.jpeg"),
            ),
          )
          ),Expanded(
              child: Container(

                margin: EdgeInsets.only(
                  left: 16.0, right: 16.0
                ),
                padding: EdgeInsets.only(
                  left: 16.0, right: 16.0
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(
                    width: 1.0, color: Colors.grey
                  )
                ),
                child: TextField(

                  controller: textController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black,
                      fontSize: 17.0 ,
                      decoration: TextDecoration.none
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write something here...\n यहाँ कुछ लिखिए...",
                    hintStyle:TextStyle(fontSize: 14.0)
                  ),

                ),
              )),
          Column(
            children: <Widget>[
              new Padding(
                padding:  EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 12.0,bottom: 0.0
                ),
                child:  Icon(Icons.photo_library),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Photo",
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }





  Posts(){


  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          createPost(),
          Divider(),
          Posts()

        ],
      ),
    );
  }
}



