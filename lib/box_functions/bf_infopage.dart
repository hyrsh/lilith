import 'package:hive/hive.dart';

const resultBox = 'results';

String getDailySpent() {
  var box = Hive.box('$resultBox');
  var ret = box.get('dailyspent');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getMonthlySpent() {
  var box = Hive.box('$resultBox');
  var ret = box.get('monthlyspent');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getYearlySpent() {
  var box = Hive.box('$resultBox');
  var ret = box.get('yearlyspent');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getDailyVolume() {
  var box = Hive.box('$resultBox');
  var ret = box.get('dailyvolume');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getMonthlyVolume() {
  var box = Hive.box('$resultBox');
  var ret = box.get('monthlyvolume');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getYearlyVolume() {
  var box = Hive.box('$resultBox');
  var ret = box.get('yearlyvolume');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getTotalDays() {
  var box = Hive.box('$resultBox');
  var ret = box.get('totaldays');
  if (ret == null) { ret = 0;}
  return ret.toString();
}

String getDistanceDifference() {
  var box = Hive.box('$resultBox');
  var ret = box.get('distancedifference');
  if (ret == null) { ret = 0;}
  return ret.toStringAsFixed(2);
}

String getTotalEntries() {
  var box = Hive.box('$resultBox');
  var ret = box.get('totalentries');
  if (ret == null) { ret = 0;}
  return ret.toString();
}