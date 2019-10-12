import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinnoba/keys/JsonKeys.dart';
import 'dart:math';


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
}