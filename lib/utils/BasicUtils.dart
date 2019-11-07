import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinnoba/keys/JsonKeys.dart';
import 'dart:math';

import 'package:vinnoba/utils/api.dart';


class BasicUtils{



  static Future<String> getPreferences( String key) async  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String value =  pref.getString(key);
    return value;
  }

  static void savePreferences( String key,String value) async  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

 static int randomNum() {
    var rng = new Random();
    int d = rng.nextInt(100);
    return d;
  }

  static void refreshTokenApi(BuildContext context,String userName,
       String clientId, String refreshToken, String serverUniqueId) async {
    Map<String,String> refreshTokenMap = {
      "user_name": userName,
      "client_id": clientId,
       "server_unique_id": serverUniqueId,
    };

    print(userName);
    Response data = await Provider.of<AllApi>
      (context).refreshToken(refreshToken, "application/json", "application/json", refreshTokenMap);

    Map header = data.headers;
    Map body = json.decode(data.bodyString);
    print("HERE IT COMES>>>>>>>");
    print(header.toString());
    print(body.toString());


  }


  static Future<String> getDeviceId() async {
    String deviceId;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceId = build.androidId;  //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceId = data.identifierForVendor;  //UUID for iOS
      }


//if (!mounted) return;
    return deviceId;
  }


}