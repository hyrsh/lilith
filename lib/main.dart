import 'package:balthasar/pages/dbedit.dart';
import 'package:balthasar/pages/dblist.dart';
import 'package:balthasar/pages/infopage.dart';
import 'package:flutter/material.dart';
import 'package:balthasar/pages/startpage.dart';
import 'package:balthasar/loading.dart';
import 'package:balthasar/pages/entrypage.dart';
import 'package:balthasar/pages/settings.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'obj_definition/base.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';

void main() async{
  //Hive start that MUST be initialized in the main()
  await Hive.initFlutter();
  //Hive register baseinfo class as adapter
  Hive.registerAdapter(BaseinfoAdapter());
  //open boxes globally (maybe insecure?), compaction strategy is for an automated "clean up" to keep appended keys under a certain limit (50)
  await Hive.openBox('$settingsBox', compactionStrategy: (entries, deletedEntries) {return deletedEntries > 50;}); //storing settings
  await Hive.openBox('$resultBox', compactionStrategy: (entries, deletedEntries) {return deletedEntries > 50;}); //storing calculated results (importance increases later on)
  await Hive.openBox('$baseBox', compactionStrategy: (entries, deletedEntries) {return deletedEntries > 50;}); //stores the main data (your entries)
  await Hive.openBox('$xcBox', compactionStrategy: (entries, deletedEntries) {return deletedEntries > 50;}); //exchanging indices between widgets (maybe there is a more clever solution)
  
  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(), //loading screen
      '/home': (context) => StartPage(), //main page of the app
      '/entry': (context) => EntryPage(), //page for entering your data
      '/settings': (context) => Settings(), //page for settings
      '/dblist': (context) => DbList(), //on settings page the "view database" page
      '/dbedit': (context) => DbEdit(), //in the "view database" page the "edit" button page
      '/info': (context) => InfoPage(), //info page

    },
  ));
}
