import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loading extends StatefulWidget { //flutter default StatefulWidget
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() { //we just call this and change nothing to be able to call a function
    super.initState();
    forward(); //the call we want!
  }
  
//forwarding after a set amount of seconds to display the "welcome screen"; it also gives us more time to "wait" for the Hive Futures
  void forward() async {
    Future.delayed(const Duration(seconds: 2), () { //delay of 2 seconds
      print('calling /home route'); //debug output
      Navigator.pushReplacementNamed(context, '/home'); //calling home route and replacing it for '/', since we can hit the "back button" and exit the app without going back to the loading screen
    });
  }

  @override
  Widget build(BuildContext context) { //flutter default Widget build
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent),
    );
    return Container( // we don't need much so a container is sufficient
      decoration: BoxDecoration( //decoration for the container
        image: DecorationImage( //the kind of decoration is an image
          image: AssetImage('assets/hexagon.gif'), //there goes the image
          fit: BoxFit.cover, //I wanted it stretched to fit the animation with the screen
        ),
      ),
    );
  }
}
