import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';

String getBackground() {
  var box = Hive.box('$settingsBox');
  dynamic bg = box.get('background');
  if (bg == null) {
    box.put('background', 'assets/background-amber.png');
    bg = box.get('background');
    return bg;
  } else {
    return bg;
  }
}

Color getTheme() {
  var box = Hive.box('$settingsBox');
  Color theme;
  dynamic bg = box.get('background');
  if (bg == 'assets/background-amber.png') {
    theme = Colors.amberAccent;
  }
  if (bg == 'assets/background-blue.png') {
    theme = Colors.lightBlueAccent[700];
  }
  if (bg == 'assets/background-red.png') {
    theme = Colors.redAccent[400];
  }
  if (bg == 'assets/background-white.png') {
    theme = Colors.grey;
  }
  if (bg == 'assets/background-green.png') {
    theme = Colors.greenAccent[400];
  }
  return theme;
}

double getPrice() {
  var box = Hive.box('$resultBox');
  var price = box.get('totalspent');
  if (price == null) {
    return 0.0;
  } else {
  return price;
  }
}

double getVolume() {
  var box = Hive.box('$resultBox');
  var volume = box.get('totalvolume');
  if (volume == null) {
    return 0.0;
  } else {
    return volume;
  }
}

String getStartdate() {
  var box = Hive.box('$settingsBox');
  DateTime date = box.get('startdate');
  if (date == null) {
    date = DateTime.now().toLocal();
  }
  var pDay = date.day.toString();
  var pMonth = date.month.toString();
  var pYear = date.year.toString();
  var pDate = '$pDay\.$pMonth\.$pYear';
  return pDate;
}

String getTotalDistance() {
  var box = Hive.box('$resultBox');
  var distance = box.get('totaldistance');
  if (distance == null) {
    return '0';
  } else {
    return distance.toString();
  }
}