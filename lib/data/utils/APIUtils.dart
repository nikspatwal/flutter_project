import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_user_session.dart';

class APIUtils {

   static FutureBuilder<Response> loginAPI(BuildContext context,String username,String password,String clientId){

    Map<String,String> map={"client_id":clientId};
    String credentials=username+":"+password;
    String auth="Basic "+base64.encode(utf8.encode(credentials));
    return FutureBuilder<Response>(

      future: Provider.of<UserSession>( context ).login(auth,map),
      builder: (context ,snapshot){
        if (snapshot.connectionState == ConnectionState.done){

          final Map map = json.decode(snapshot.data.bodyString);
          print(map.toString());
          return Center(
            child: Text(map.toString()),
          );

        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      } ,
    );
  }

}