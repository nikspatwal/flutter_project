import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinnoba/keys/PrefKeys.dart';
import 'dart:math';

import 'package:vinnoba/utils/api.dart';

class BasicUtils {
  static Future<String> getPreferences(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String value = pref.getString(key);
    return value;
  }

  static void savePreferences(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static int randomNum() {
    var rng = new Random();
    int d = rng.nextInt(100);
    return d;
  }



  static Future<String> getDeviceId() async {
    String deviceId;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      deviceId = build.androidId; //UUID for Android
    } else if (Platform.isIOS) {
      IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      deviceId = data.identifierForVendor; //UUID for iOS
    }
    return deviceId;
  }
}
