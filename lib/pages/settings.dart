import 'package:balthasar/box_functions/bf_settings.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String profile = getProfilename();
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/settings.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      obscureText: false,
                      onSubmitted: (String prf) {
                        setProfilename(prf);
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        labelText: getProfilename(),
                      ),
                    )),
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dblist');
                  },
                  color: Colors.grey[900],
                  icon: Icon(
                    Icons.menu,
                    color: getTheme(),
                  ),
                  label: Text(
                    'Tankliste',
                    style: TextStyle(color: getTheme()),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/maintlist');
                  },
                  color: Colors.grey[900],
                  icon: Icon(
                    Icons.menu,
                    color: getTheme(),
                  ),
                  label: Text(
                    'Wartungen',
                    style: TextStyle(color: getTheme()),
                  ),
                ),
                SizedBox(height: 40),
                FlatButton.icon(
                  onPressed: () {
                    var bx = Hive.box('$settingsBox');
                          dynamic cur = bx.get('background');
                          if (cur == 'assets/background-amber.png') {
                            bx.put('background', 'assets/background-blue.png');
                          }
                          if (cur == 'assets/background-blue.png') {
                            bx.put('background', 'assets/background-red.png');
                          }
                          if (cur == 'assets/background-red.png') {
                            bx.put('background', 'assets/background-white.png');
                          }
                          if (cur == 'assets/background-white.png') {
                            bx.put('background', 'assets/background-green.png');
                          }
                          if (cur == 'assets/background-green.png') {
                            bx.put('background', 'assets/background-amber.png');
                          }
                          setState(() {});
                  },
                  color: Colors.grey[900],
                  icon: Icon(
                    Icons.colorize,
                    color: getTheme(),
                  ),
                  label: Text(
                    'Style',
                    style: TextStyle(color: getTheme()),
                  ),
                ),
                SizedBox(height: 80),
                FlatButton.icon(
                  onPressed: (){
                    createBackup(context);
                  },
                  color: Colors.grey[900],
                  icon: Icon(
                    Icons.save_alt,
                    color: getTheme(),
                  ),
                  label: Text(
                    'Backup',
                    style: TextStyle(color: getTheme()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}