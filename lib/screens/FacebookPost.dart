import 'package:flutter/material.dart';

class FacebookPost extends StatefulWidget{

  final image, content, name, time, likes, comments, shares;

  FacebookPost({
    this.image, this.content, this.name, this.time, this.likes, this.comments, this.shares
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FacebookPostState();
  }
}

class FacebookPostState extends State<FacebookPost>{




  @override
  Widget build(BuildContext context) {

    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              child: new Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    image: AssetImage(widget.image),
                  ),
                ),
              ),
            ),
            title: new Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Row(
              children: [
                new Text(widget.time),
                new Icon(
                  Icons.public,
                  size: 15.0,
                )
              ],
            ),
            trailing: new Icon(Icons.more_horiz),
          ),
          ListTile(
            title: Text(widget.content),
          ),
          Container(
            padding: new EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[

                    new CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Color(0xff3b5998),
                      child: new Icon(Icons.thumb_up, size: 12.0, color: Colors.white, ), ),

                    new CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.red,
                      child: new Icon(IconData(0xe9da, fontFamily: 'icomoon'), size: 12.0, color: Colors.white, ), ),

                    new Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 8.0
                      ),
                      child: new Text(widget.likes),
                    ),
                  ],
                ),
                new Expanded(child:Text(widget.comments + " comments " + widget.shares + " share")),
              ],
            ),
          )
        ],
      ),
    );
  }
}



