import 'package:balthasar/box_functions/bf_dblist.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:balthasar/obj_definition/maintenance.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//Boxes for Hive
const resultBox = 'results';
const settingsBox = 'settings';
const baseBox = 'base';
const xcBox = 'indexchange';
const mt = 'maintenance';

class MaintList extends StatefulWidget {
  @override
  _MaintListState createState() => _MaintListState();
}

class _MaintListState extends State<MaintList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wartungen'),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          var list = getRawMaintList();
          Maintenance objMaint = list[index];
          return ListTile(
            leading: Text(objMaint.plannedDate, style: TextStyle(color: getTheme())),
            title: Text(objMaint.atDistance+' km', style: TextStyle(color: getTheme())),
            subtitle: Text(objMaint.description, style: TextStyle(color: getTheme())),
            isThreeLine: true,
            dense: false,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    var indexBox = Hive.box('$xcBox'); //open index box for sharing current index
                    indexBox.put('sharedindexmaintenance', index); //overwrite key sharedindex with current index
                    Navigator.pushNamed(context, '/maintedit'); //push to edit page
                  },
                  icon: Icon(Icons.edit, color: getTheme(),),
                ),
                IconButton(
                  onPressed: (){
                    try { deleteEntryMaint(index); } catch (_) { print('Last item in DB error catched! Calling safe function.'); safeNull(); } //only errors on a complete deletion
                    setState(() {});
                    },
                  icon: Icon(Icons.delete, color: getTheme(),),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        itemCount: getMaintLength(),
        ),
    );
  }
}
