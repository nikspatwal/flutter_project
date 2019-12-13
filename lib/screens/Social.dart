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
                image: NetworkImage("https://scontent.fdel1-1.fna.fbcdn.net/v/t1.0-9/43952769_1931833063570877_1734454089300836352_n.jpg?_nc_cat=109&_nc_ohc=xY-T377edBIAQk83DKi9r1KtXZmImSyF4SH7KYPWgfsdobSVOkMXOHZ5g&_nc_ht=scontent.fdel1-1.fna&oh=a64db1346f9c7cfdd9364611aa7ea9a0&oe=5E76F776)")
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
                    hintText: "Write something here...",
                    hintStyle:
                  ),

                ),
              ))
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          createPost(),
        ],
      ),
    );
  }
}



