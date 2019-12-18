import 'package:flutter/material.dart';
import 'package:flutter_reactive_button/flutter_reactive_button.dart';

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
  bool liked = false;
  String facebook;
  String emo="Like";
  pressed(){
   setState(() {
     liked = !liked;
   });
  }

  List<ReactiveIconDefinition> _facebook = <ReactiveIconDefinition>[
    ReactiveIconDefinition(
      assetIcon: 'images/like.gif',
      code: 'like',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/haha.gif',
      code: 'haha',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/love.gif',
      code: 'love',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/sad.gif',
      code: 'sad',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/wow.gif',
      code: 'wow',
    ),
    ReactiveIconDefinition(
      assetIcon: 'images/angry.gif',
      code: 'angry',
    ),
  ];

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
          ),
          Container(alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: 6.0,right: 6.0,top: 8.0
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    /*Flexible(flex: 1,
                        child: FlatButton.icon(onPressed:() => pressed(),
                      color: Colors.white,
                      icon: Icon(
                          liked?Icons.favorite: Icons.favorite_border,
                        color: liked? Colors.red: Colors.grey,),

                      label: Text("Like",
                        style: TextStyle(fontFamily: 'icomoon',
                            color: liked? Colors.blue: Colors.grey),

                      ),
                    )),*/

                    Flexible(flex:1,
                        child: ReactiveButton(icons: _facebook,
                        onSelected: (ReactiveIconDefinition button){
                          setState(() {
                            facebook = button.code;
                            emo=button.code;
                          });
                        },
                        onTap: (){
                          print("TAP");
                        },
                        child: facebook==null?
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.thumb_up),
                              Text(emo,style: TextStyle(color: Colors.grey),)
                            ],
                          ),):
                        Container(
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'images/$facebook.png',
                                width: 32.0,
                                height: 32.0,
                              ),
                              Text(emo,style: TextStyle(color: Colors.blue),)
                            ],
                          ),)
                    )),
                   /* Flexible(flex:1,
                        child: FlatButton.icon(onPressed:() => pressed(),
                      color: Colors.white,
                      icon: Icon(Icons.chat_bubble_outline),
                      label: Text("Comment",
                          style: TextStyle(fontFamily: 'icomoon',
                              color: Colors.grey)
                      ),)),

                    Flexible(flex:1,
                        child:FlatButton.icon(onPressed:() => pressed(),
                      color: Colors.white,
                      icon: Icon(Icons.forward),
                      label: Text("Share",
                          style: TextStyle(fontFamily: 'icomoon',
                              color: Colors.grey)
                      ),)),*/



                    /*ReactiveButton(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          color: Colors.white,
                        ),
                        width: 80.0,
                        height: 40.0,
                        child: Center(
                          child: facebook == null
                              ? Text('click')
                              : Image.asset(
                            'images/$facebook.png',
                            width: 32.0,
                            height: 32.0,
                          ),
                        ),
                      ),
                      icons: _facebook, //_flags,
                      onTap: () {
                        print('TAP');
                      },
                      onSelected: (ReactiveIconDefinition button) {
                        setState(() {
                          facebook = button.code;
                        });
                      },
                      iconWidth: 32.0,
                    ),*/
                    

                  ])
          )
        ],
      ),
    );
  }
}



