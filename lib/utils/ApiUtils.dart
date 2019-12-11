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

    print(userName);
    Response data = await Provider.of<AllApi>(context).refreshToken(
        refreshToken, "application/json", "application/json", refreshTokenMap);

    if(data.statusCode==200){
      Map header = data.headers;
      Map body = json.decode(data.bodyString);
      print("HERE IT COMES>>>>>>>");
      print(header.toString());
      print(body.toString());
      return true;
    }
  }
}