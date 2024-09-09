import 'dart:async';

import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/home');
    });
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/3.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
          color: Color(0xfff5d693),
        ),
        alignment: Alignment.center,
        child: Container(
          child: Text(
            '||  श्रीमद भगवद गीता  ||',
            style: TextStyle(
                height: 0.1,
                color: Color(0xff7d522f),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
