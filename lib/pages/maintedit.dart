import 'package:balthasar/box_functions/bf_dbedit.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

class MaintEdit extends StatefulWidget {
  @override
  _MaintEditState createState() => _MaintEditState();
}

class _MaintEditState extends State<MaintEdit> {

  static String date, description, distance;

  @override
  void initState(){
    super.initState();
    print('editing requested');
    date = getIndexedMaintData(1);
    print('editing date: $date');
    description = getIndexedMaintData(2);
    print('editing description: $description');
    distance = getIndexedMaintData(3);
    print('editing distance: $distance');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = new TextEditingController(text: date);
    TextEditingController descriptionController = new TextEditingController(text: description);
    TextEditingController distanceController = new TextEditingController(text: distance);
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Image.asset('assets/dbedit.png', fit: BoxFit.cover)),
        Material(
          color: Colors.transparent,
          child: SafeArea(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Colors.black,
                    child: Text('Eintrag ändern',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ))),
                SizedBox(height: 20.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: dateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getTheme()),
                      ),
                      labelText: 'Datum ändern',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getTheme()),
                      ),
                      labelText: 'Beschreibung ändern',
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
                      labelText: 'Kilometer ändern:',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FlatButton(
                  onPressed: () { 
                    updateDataMaint(dateController.text, descriptionController.text, distanceController.text);
                    Navigator.pop(context);
                     },
                  color: Colors.grey[900],
                  child: Text('OK', style: TextStyle(color: getTheme())),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
