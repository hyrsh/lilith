import 'package:balthasar/box_functions/bf_settings.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';


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
                    'Einträge (Database)',
                    style: TextStyle(color: getTheme()),
                  ),
                ),
                SizedBox(height: 20),
                FlatButton.icon(
                  onPressed: (){
                    print('Calling Backup');
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