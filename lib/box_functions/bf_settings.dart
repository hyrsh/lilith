import 'dart:io';

import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:balthasar/obj_definition/base.dart';
import 'package:balthasar/obj_definition/maintenance.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

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

void createBackup(BuildContext context) {
  var box = Hive.box('$baseBox');
  var items = box.length;
  var boxMaint = Hive.box('$mt');
  var itemsMaint = boxMaint.length;
  DateTime date = DateTime.now().toLocal();
  String fileDate = date.year.toString()+date.month.toString()+date.day.toString();
  String fileName = 'lilith_backup_'+fileDate+'.csv';
  String formattedOutput = 'Lilith application backup from $date\n';
  String hDate, hPrice, hVolume, hDistance;
  String mDate, mDistance, mDescr;

  for (var i = 0; i < items; i++) {
    var buf = box.getAt(i) as Baseinfo;
    hDate = buf.currentDate.toString();
    hPrice = buf.price.toString();
    hVolume = buf.volume.toString();
    hDistance = buf.distance.toString();
    formattedOutput += hDate+', '+hPrice+' €, '+hVolume+' L, '+hDistance+' km\n';
  }

  formattedOutput += '\nEingetragene Wartungen:\n';

  for (var i = 0; i < itemsMaint; i++) {
    var buf = boxMaint.getAt(i) as Maintenance;
    mDate = buf.plannedDate;
    mDistance = buf.atDistance;
    mDescr = buf.description;
    formattedOutput += mDate+', '+mDistance+', '+mDescr+'\n';
  }

  _backupNote(context, fileName);
  _write(formattedOutput, fileName);
}

void _write(String data, String fileName) async {
  final Directory directory = await getExternalStorageDirectory();
  final File file = File('${directory.path}/$fileName');
  await file.writeAsString(data);
  print('Backup created with name: $fileName');
}

Future<void> _backupNote(BuildContext context, String fileName) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // force to tap
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Backup done!', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Data written to:\n - $fileName', style: TextStyle(color: getTheme())),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            color: Colors.grey[800],
            child: Text('Ok', style: TextStyle(color: getTheme())),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}