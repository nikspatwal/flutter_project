import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'FacebookPost.dart';

class Social extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocialState();
  }
}

class SocialState extends State<Social>{


  var postImages = [
     "assets/images/1.jpeg",
     "assets/images/2.jpeg",
     "assets/images/3.jpeg",
     "assets/images/4.jpeg",] ;
  var postNames = ["Rachel Green",
     "Monica Geller",
    "Chandler Bing",
    "Pheobe Buffay",
  ];
  var postContents = [
     "Loving the Weather... Chilling Cold!!..",
     "Social Media is love.. Connecting individual to the world... Sounds Awesome!...",
     "Merry Christmas in Advance.",
    "Delhi is burning. Protest is on fire people."
  ] ;
  var postTimes = [
    "10 mins ago · ",
    "20 mins ago · ",
     "1 hour ago · ",
     "1 hour ago · "
  ];
  var postLikes = [
     "Rose Geller and 6 others",
     "Joey Tribiaani and 16 others",
     "Jason Momoa and 6 others",
     "Gerard Butler and 16 others"
  ] ;
  var postComments = ["12", "24", "16",  "34"];
  var postShares = [ "1",  "2",  "3",  "2"];

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











  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          createPost(),
          Divider(),
          FacebookPost(
              image: postImages[0],
              content: postContents[0],
              name: postNames[0],
              likes: postLikes[0],
              comments: postComments[0],
              shares: postShares[0],
              time: postTimes[0]),
          FacebookPost(
              image: postImages[1],
              content: postContents[1],
              name: postNames[1],
              likes: postLikes[1],
              comments: postComments[1],
              shares: postShares[1],
              time: postTimes[1]),
          FacebookPost(
              image: postImages[2],
              content: postContents[2],
              name: postNames[2],
              likes: postLikes[2],
              comments: postComments[2],
              shares: postShares[2],
              time: postTimes[2]),
          FacebookPost(
              image: postImages[3],
              content: postContents[3],
              name: postNames[3],
              likes: postLikes[3],
              comments: postComments[3],
              shares: postShares[3],
              time: postTimes[3])

        ],
      ),
    );
  }
}



