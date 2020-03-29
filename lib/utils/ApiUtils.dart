import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinnoba/keys/PrefKeys.dart';

import 'BasicUtils.dart';
import 'api.dart';

class ApiUtils{

  static Future refreshTokenApi(BuildContext context) async {
    String userName = await BasicUtils.getPreferences(PrefKeys.username);
    String clientId = await BasicUtils.getPreferences(PrefKeys.clientId);
    String refreshToken = await BasicUtils.getPreferences(PrefKeys.refreshToken);
    String serverUniqueId = await BasicUtils.getPreferences(PrefKeys.serverUniqueId);
    Map<String, String> refreshTokenMap = {
      "user_name": userName,
      "client_id": clientId,
      "server_unique_id": serverUniqueId,
    };

    print("REFRESH 1 ");
    Response data = await Provider.of<AllApi>(context).refreshToken(
        refreshToken, "application/json", "application/json", refreshTokenMap);
    print("REFRESH 2 ");

    if(data.statusCode==200){
      Map header = data.headers;
      BasicUtils.savePreferences( PrefKeys.token ,header['x-auth-token'] );
      Map body = json.decode(data.bodyString);
      print("REFRESH 3");
      print(header.toString());
      print(body.toString());
      int code = data.statusCode;
      return code;
    }
  }
}