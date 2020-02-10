import 'package:balthasar/box_functions/bf_entry.dart';
import 'package:balthasar/obj_definition/base.dart';
import 'package:balthasar/obj_definition/maintenance.dart';
import 'package:balthasar/pages/maintlist.dart';
import 'package:hive/hive.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

void updateData(String date, dynamic price, dynamic volume, dynamic distance) {
  //as long as I do not fully understand to correctly pass variables between widgets
  //I will just use the Hive and overwrite one integer on each change
  //since this happens less frequently or even never, it is ok to "waste" computing power to another init of a box
  var indexBox = Hive.box('$xcBox'); //index exchanging box
  var index = indexBox.get('sharedindex'); //get value (int) at sharedindex key from index exchanging box
  var box = Hive.box('$baseBox'); //main data box
  DateTime cDate;
  try {
    cDate = DateTime.parse(date);
  } catch (error) {
    print('Date caused parsing error, defaulting to now()');
    cDate = DateTime.now().toLocal(); //if the user enters bullshit it just gets reset to the current timestamp
  }

  double cDistance = double.parse(distance); //parsing to stay at the defined type for our base model
  double cPrice = double.parse(price); //parsing to stay at the defined type for our base model
  double cVolume = double.parse(volume); //parsing to stay at the defined type for our base model

  Baseinfo bi = Baseinfo(cDate, cPrice, cVolume, cDistance);
  print('index edited: $index');
  print('date edited to: $cDate');
  print('price edited to: $cPrice');
  print('volume edited to: $cVolume');
  print('distance edited to: $cDistance');
  box.putAt(index, bi);
  calcData();
}

String getIndexedData(int choice) {
  var indexBox = Hive.box('$xcBox'); //open index box
  var index = indexBox.get('sharedindex'); //get index
  var box = Hive.box('$baseBox'); //open main data box
  var raw = box.getAt(index) as Baseinfo; //get main data at specific index
  var ret; //return placeholder to keep code clean
  switch(choice) {
    case 1: { //return date
      ret = raw.currentDate;
    } break;
    case 2: { //return price
      ret = raw.price;
    } break;
    case 3: { //return volume
      ret = raw.volume;
    } break;
    case 4: { //return distance
      ret = raw.distance;
    } break;
  }
  return ret.toString();
}

String getIndexedMaintData(int choice) {
  var indexBox = Hive.box('$xcBox'); //open index box
  var index = indexBox.get('sharedindexmaintenance'); //get index
  var box = Hive.box('$mt'); //open main data box
  var raw = box.getAt(index) as Maintenance; //get main data at specific index
  var ret; //return placeholder to keep code clean
  switch(choice) {
    case 1: { //return date
      ret = raw.plannedDate;
    } break;
    case 2: { //return price
      ret = raw.description;
    } break;
    case 3: { //return volume
      ret = raw.atDistance;
    } break;
  }
  return ret;
}

void updateDataMaint(String date, String description, String distance) {
  //same as in the updateData(...)
  var indexBox = Hive.box('$xcBox'); //index exchanging box
  var index = indexBox.get('sharedindexmaintenance'); //get value (int) at sharedindex key from index exchanging box
  var box = Hive.box('$mt'); //maintenance data box

  String cDate = date.toString();
  String cDescr = description.toString();
  String cDistance = distance.toString();

  Maintenance objMaint = Maintenance(cDate, cDistance, cDescr);
  print('index edited: $index');
  print('date edited to: $date');
  print('description edited to: $description');
  print('distance edited to: $distance');
  box.putAt(index, objMaint);
  MaintList().createState();
}