import 'dart:async';


import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "/My"));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
        color: Colors.orangeAccent,
        child: Center(
            child: Text(
          "Indian Emergency Helplines",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30.0, color: Colors.black, fontStyle: FontStyle.italic,),
        )));
  }
}
