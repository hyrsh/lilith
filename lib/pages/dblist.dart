import 'package:balthasar/box_functions/bf_dbedit.dart';
import 'package:balthasar/box_functions/bf_dblist.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:balthasar/obj_definition/base.dart';
import 'package:balthasar/pages/startpage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DbList extends StatefulWidget {
  @override
  _DbListState createState() => _DbListState();
}

class _DbListState extends State<DbList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einträge'),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          var list = getRawList();
          Baseinfo bi = list[index];
          return ListTile(
            leading: Text(bi.distance.toString()+'km', style: TextStyle(color: getTheme())),
            title: Text(bi.price.toString()+'€, '+bi.volume.toString()+'L', style: TextStyle(color: getTheme())),
            subtitle: Text(bi.currentDate.toString(), style: TextStyle(color: getTheme())),
            isThreeLine: false,
            dense: false,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    var indexBox = Hive.box('$xcBox'); //open index box for sharing current index
                    indexBox.put('sharedindex', index); //overwrite key sharedindex with current index
                    Navigator.pushNamed(context, '/dbedit'); //push to edit page
                  },
                  icon: Icon(Icons.edit, color: getTheme(),),
                ),
                IconButton(
                  onPressed: (){
                    try { deleteEntry(index); } catch (_) { print('Last item in DB error catched! Calling safe function.'); safeNull(); } //only errors on a complete deletion
                    StartPage().createState(); //create state at the start page to see changes, can someone verify if this is a good idea?
                    setState(() {});
                    },
                  icon: Icon(Icons.delete, color: getTheme(),),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        itemCount: getDBLength(),
        ),
    );
  }
}
