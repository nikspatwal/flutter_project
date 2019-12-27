import 'package:flutter/material.dart';
import 'package:vinnoba/screens/GatePage.dart';
import 'package:vinnoba/screens/NewVisitorOne.dart';
import 'package:vinnoba/screens/SettingPage.dart';
import 'package:vinnoba/screens/User.dart';
import 'package:vinnoba/screens/Visitors.dart';

class ManageVisitors extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return ManageVisitorsState();
  }
}

class ManageVisitorsState extends State{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Visitors",
          style: TextStyle(
              color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
            ),
            ListTile(
              title: Text("User"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => User())),
            ),

            ListTile(
              title: Text("Visitors"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Visitors())),
            ),

            ListTile(
              title: Text("New Visitor"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewVisitorOne())),
            ),

            ListTile(
              title: Text("Employees Work History"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => null)),
            ),

            ListTile(
              title: Text("Change Gate"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GatePage())),
            ),

            ListTile(
              title: Text("Setting"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage())),
            ),

            ListTile(
              title: Text("Logout"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => null)),
            )
          ],
        ),

      ),

      body:  Padding(padding: EdgeInsets.only(
          top: 50.0,bottom: 50.0,right: 20.0),
        child: Image.asset('assets/images/building1.jpg',fit: BoxFit.fill,

          /*alignment: Alignment.topCenter,*/),
      ),
    );
  }

}
