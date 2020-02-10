import 'package:balthasar/box_functions/bf_entry.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

class MaintEntryPage extends StatefulWidget {
  @override
  _MaintEntryPageState createState() => _MaintEntryPageState();
}

class _MaintEntryPageState extends State<MaintEntryPage> {

  TextEditingController dateController = new TextEditingController();
  TextEditingController descrController = new TextEditingController();
  TextEditingController distanceController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Image.asset('assets/entry.png', fit: BoxFit.cover)),
        Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  color: Colors.black,
                  child: Text('Wartung hinzufügen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ))),
              SizedBox(height: 20.0),
              Container(
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: getTheme()),
                    ),
                    labelText: 'Datum',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: descrController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: getTheme()),
                    ),
                    labelText: 'Beschreibung',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: distanceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: getTheme()),
                    ),
                    labelText: 'Kilometerzahl',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: () { 
                  sendDataMaint(dateController.text, distanceController.text, descrController.text);
                  Navigator.pop(context);
                   },
                color: Colors.grey[900],
                child: Text('OK', style: TextStyle(color: getTheme())),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
