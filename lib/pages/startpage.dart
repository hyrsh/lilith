import 'package:balthasar/box_functions/bf_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'package:balthasar/box_functions/bf_startpage.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void externalRedraw() {setState(() {});}
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              getBackground(),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 120),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      'Ausgaben:',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )),
                    Text(
                      getPrice().toStringAsFixed(2)+' €',
                      style: TextStyle(color: getTheme(), fontSize: 20),
                    ),
                  ],
                ),
                //Text('Gesamt: $euro€, ${liter}L', style: TextStyle(color: Colors.amberAccent, fontSize: 20,),),
              ),
              SizedBox(height: 5.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      'Verbraucht:',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )),
                    Text(
                      getVolume().toStringAsFixed(2)+' L',
                      style: TextStyle(color: getTheme(), fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      'Kilometerstand:',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )),
                    Text(
                      getTotalDistance()+' km',
                      style: TextStyle(color: getTheme(), fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Center(
                      child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/entry');
                    },
                    child: Icon(
                      Icons.library_add,
                      color: getTheme(),
                      size: 90,
                    ),
                  )),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Center(
                  child: Center(
                      child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/maintentry');
                    },
                    child: Icon(
                      Icons.build,
                      color: getTheme(),
                      size: 45,
                    ),
                  )),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            child: SafeArea(
                child: Text(
              'Startdatum: '+getStartdate(),
              style: TextStyle(
                color: getTheme(),
                fontSize: 10,
              ),
            )),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: SafeArea(
                child: Text(
              getProfilename(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            )),
          ),
          Container(
              alignment: Alignment.bottomRight,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        child: Icon(
                          Icons.settings_applications,
                          color: getTheme(),
                        )),
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/info');
        },
        child: Icon(Icons.info_outline, size: 40, color: getTheme()),
        backgroundColor: Colors.black87,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
