import 'package:balthasar/box_functions/bf_entry.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {

  TextEditingController priceController = new TextEditingController();
  TextEditingController volumeController = new TextEditingController();
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
                  child: Text('Eintrag hinzufügen',
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
                    labelText: 'Preis in € (z.B. 13.37)',
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
                    labelText: 'Menge in L (z.B. 47.11)',
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
                    labelText: 'Kilometer in km (z.B. 17345.11)',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10),
              FlatButton(
                onPressed: () { 
                  sendData(priceController.text, volumeController.text, distanceController.text);
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
