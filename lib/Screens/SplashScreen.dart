import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:schoolsmapapplication/Screens/ProvinceScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.lightBlueAccent,
      splash: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/school.png",
              height: 30,
              width: 30,
            ),
            Text("Schools Map"),
          ],
        ),
      ),
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: ProvinceScreen(),
    );
  }
}
