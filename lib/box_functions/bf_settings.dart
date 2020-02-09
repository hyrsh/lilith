// import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

String getProfilename() {
  var box = Hive.box('settings');
  String profilename = box.get('profilename');
  if(profilename == null){
    profilename = 'Kennzeichen *';
    return profilename;
  } else {
  return profilename;
  }
}

void setProfilename(String name) {
  var box = Hive.box('settings');
  box.put('profilename', '$name');
}