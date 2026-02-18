

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferenceFile {
  static late SharedPreferences pref;
static Future<void> initSharedPreference()async{
pref=await SharedPreferences.getInstance();
  }

static Future<void> saveData(String key,dynamic value)async{
  if(value is String){
await    pref.setString(key, value);

  }
   else if (value is int){
    await pref.setInt(key, value);
   }  
   else if(value is double){
   await pref.setDouble(key, value);
   }
   else if(value is bool){
   await pref.setBool(key, value);
   }
   else if(value is List<String>){
   await pref.setStringList(key, value);
   }
   else{
   log("UnExcepected type");
   }
 }

static Future<Object?> getData(String key)async{
  return pref.get(key);
 }

static Future<void> removeData(String key) async{
  await pref.remove( key);
}
}