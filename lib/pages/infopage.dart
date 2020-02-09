import 'package:balthasar/box_functions/bf_infopage.dart';
import 'package:balthasar/box_functions/bf_startpage.dart';
import 'package:flutter/material.dart';


class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiken', style: TextStyle(color: getTheme())),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Table(
          border: TableBorder(horizontalInside: BorderSide(color: getTheme(), width: 1)),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('Ausgaben gesamt:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getPrice().toStringAsFixed(2)+' €', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('Verbrauch gesamt:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getVolume().toStringAsFixed(2)+' L', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('Kilometerstand:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getTotalDistance()+' km', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('tägl./mtl. Ausgaben:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getDailySpent()+' €  /  '+getMonthlySpent()+' €', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('tägl./mtl. Verbrauch:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getDailyVolume()+' L  /  '+getMonthlyVolume()+' L', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('jährliche Ausgaben:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getYearlySpent()+' €', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('jährlicher Verbrauch:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getYearlyVolume()+' L', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('Tage seit Beginn:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getTotalDays()+' T', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('Kilometer seit letztem Eintrag:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getDistanceDifference()+' km', style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(child: Text('Einträge insgesamt:', style: TextStyle(color: Colors.white, fontSize: 15))),
                      Text(getTotalEntries(), style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
