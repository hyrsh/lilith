import 'package:balthasar/obj_definition/base.dart';
import 'package:balthasar/obj_definition/maintenance.dart';
import 'package:balthasar/pages/dblist.dart';
import 'package:balthasar/pages/startpage.dart';
import 'package:hive/hive.dart';

const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const mt = 'maintenance';

void sendData(String price, String volume, String distance) {
  DateTime cDate = DateTime.now().toLocal();
  double cPrice, cVolume, cDistance;
  if (price != '' ) { cPrice = double.parse(price); } else { cPrice = 0.0; }
  if (volume != '' ) { cVolume = double.parse(volume); } else { cVolume = 0.0; }
  if (distance != '' ) { cDistance = double.parse(distance); } else { cDistance = 0.0; }

  var box = Hive.box('$baseBox');
  Baseinfo bi = Baseinfo(cDate, cPrice, cVolume, cDistance); //create Baseinfo data type with given values
  box.add(bi); //append bi to data box; we use "add" to rely on self-incrementing indices in Hive (we need inceremental indices for editing and calculating)
  calcData(); //calculate after each additional entry
}

void calcData() { //here we just set all necessary data for further processing
  var data = Hive.box('$baseBox');  //access boxes
  var res = Hive.box('$resultBox'); //access boxes
  var settings = Hive.box('$settingsBox'); //access boxes
  var datalength = data.length; //number of entries
  var spent = 0.0; //explicit init with 0.0 for spent calculation
  var volume = 0.0; //explicit init with 0.0 for volume calculation
  var firstentry = data.getAt(0) as Baseinfo; //get the first entry in the database (data box)
  var lastentry = data.getAt(datalength-1) as Baseinfo; //get the last entry in the database (data box)
  var distancedifference; //do I really need to explain?

  DateTime startdate;
  if (firstentry == null) { startdate = DateTime.now().toLocal(); } else { startdate = firstentry.currentDate; } //if the database is entry, prevent a "NULL" exception

  for (var i = 0; i < datalength; i++) { //sum up price and volume over the whole data box (all entries)
    var raw = data.getAt(i) as Baseinfo;
    if (raw.price == null) { //prevent empty database errors
      spent += 0.0;
    } else {
      spent += raw.price;
    }
    if (raw.volume == null) { //prevent empty database errors
      volume += 0.0;
    } else {
      volume += raw.volume;
    }
  }

  settings.put('startdate', startdate); //put the initial date in the settings box
  res.put('lastdate', lastentry.currentDate); //put the last registered date in the results box
  var tDays = lastentry.currentDate.difference(startdate).inDays; //calculate the days between the first and the last date (to be able to estimate time based statistics)
  if (tDays > 0) { //less than 0 days will not make sense
    res.put('totaldays', tDays);
  } else {
    res.put('totaldays', 0);
  }
  res.put('totaldistance', lastentry.distance); //put total distance in the results box
  res.put('totalspent', spent); //put the total spent amount in the results box
  res.put('totalvolume', volume); //put the total volume in the results box
  if (datalength > 1) {
    var lastdistance = data.getAt(datalength-1) as Baseinfo;
    var previousdistance = data.getAt(datalength-2) as Baseinfo;
    distancedifference = lastdistance.distance - previousdistance.distance;
  } else {
    distancedifference = 0;
  }
  res.put('distancedifference', distancedifference);
  res.put('totalentries', datalength);
  StartPage().createState(); //still not sure if this is a good idea ... feels wrong
  DbList().createState(); //still not sure if this is a good idea ... feels wrong
  calcInfoData(); //pass on to further processing
}

void calcInfoData() {
  var res = Hive.box('$resultBox');
  var totaldays = res.get('totaldays');
  var totalspent = res.get('totalspent');
  var totalvolume = res.get('totalvolume');

  if (totaldays == 0 || totaldays == 1){
    res.put('dailyspent', totalspent);
    res.put('dailyvolume', totalvolume);
    res.put('monthlyspent', totalspent);
    res.put('monthlyvolume', totalvolume);
  } else {
    var dailyspent = totalspent / totaldays;
    var monthlyspent = dailyspent * 30;
    var yearlyspent = dailyspent *365;
    var dailyvolume = totalvolume / totaldays;
    var monthlyvolume = dailyvolume * 30;
    var yearlyvolume = dailyvolume *365;

    res.put('dailyspent', dailyspent);
    res.put('dailyvolume', dailyvolume);
    res.put('monthlyspent', monthlyspent);
    res.put('monthlyvolume', monthlyvolume);
    res.put('yearlyspent', yearlyspent);
    res.put('yearlyvolume', yearlyvolume);
  }
}

void sendDataMaint(String date, String descr, String distance) {
  var box = Hive.box('$mt');
  Maintenance objMaint = Maintenance(date, descr, distance); //create Maintenance data type with given values
  box.add(objMaint); //append bi to data box; we use "add" to rely on self-incrementing indices in Hive (we need inceremental indices for editing and calculating)
}