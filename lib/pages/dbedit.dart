import 'package:balthasar/box_functions/bf_dbedit.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DbEdit extends StatefulWidget {
  @override
  _DbEditState createState() => _DbEditState();
}

class _DbEditState extends State<DbEdit> {

  static String price, volume, distance, date;

  @override
  void initState(){
    super.initState();
    print('editing requested');
    date = getIndexedData(1);
    print('editing date: $date');
    price = getIndexedData(2);
    print('editing price: $price');
    volume = getIndexedData(3);
    print('editing volume: $volume');
    distance = getIndexedData(4);
    print('editing distance: $distance');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController priceController = new TextEditingController(text: price);
    TextEditingController volumeController = new TextEditingController(text: volume);
    TextEditingController distanceController = new TextEditingController(text: distance);
    TextEditingController dateController = new TextEditingController(text: date);
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
                    controller: priceController,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
                    ),
                    inputFormatters: [
                      WhitelistingTextInputFormatter(new RegExp(r'[0-9\.]'))
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getTheme()),
                      ),
                      labelText: 'Preis ändern',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: volumeController,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
                    ),
                    inputFormatters: [
                      WhitelistingTextInputFormatter(new RegExp(r'[0-9\.]'))
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getTheme()),
                      ),
                      labelText: 'Menge ändern',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: distanceController,
                    keyboardType: TextInputType.numberWithOptions( signed: false, decimal: true,),
                    inputFormatters: [WhitelistingTextInputFormatter(new RegExp(r'[0-9\.]'))],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getTheme()),
                      ),
                      labelText: 'Kilometer ändern:',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: dateController,
                    keyboardType: TextInputType.datetime,
                    // inputFormatters: [
                    //   WhitelistingTextInputFormatter(new RegExp(r'[0-9.:-]'))
                    // ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: getTheme()),
                      ),
                      labelText: 'Datum ändern',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                FlatButton(
                  onPressed: () { 
                    updateData(dateController.text, priceController.text, volumeController.text, distanceController.text);
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
