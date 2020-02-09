import 'package:balthasar/box_functions/bf_entry.dart';
import 'package:hive/hive.dart';

const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';

int getDBLength() {
  var box = Hive.box('$baseBox').length;
  return box;
}

List getRawList() {
  var box = Hive.box('$baseBox');
  Map<dynamic, dynamic> raw = box.toMap();
  List list = raw.values.toList();
  return list;
}

void deleteEntry(int index) {
  var box = Hive.box('$baseBox');
  box.deleteAt(index);
  calcData();
}

void safeNull() {
  var res = Hive.box('$resultBox');
  var settings = Hive.box('$settingsBox');
  var dBuf = 0.0;
  var dDate = DateTime.now().toLocal();
  settings.put('startdate', dDate);
  res.put('totalspent', dBuf);
  res.put('totalvolume', dBuf);
  res.put('totaldistance', '0');
  res.put('lastdate', dDate);
  res.put('dailyspent', 0);
  res.put('monthlyspent', 0);
  res.put('yearlyspent', 0);
  res.put('dailyvolume', 0);
  res.put('monthlyvolume', 0);
  res.put('yearlyvolume', 0);
  res.put('totaldays', 0);
  res.put('distancedifference', 0);
  res.put('totalentries', 0);
}