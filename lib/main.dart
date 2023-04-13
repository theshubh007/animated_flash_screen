import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math' as math;
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camp Yellow',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const Splash_screen(),
    );
  }
}

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  bool _showSplash = true;
  @override
  void initState() {
    super.initState();
    // Set a timer to hide the splash screen after some delay
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return AnimatedSplashScreen(
      curve: Curves.bounceInOut,
      splash: AnimatedContainer(
        decoration: BoxDecoration(
          shape: _showSplash ? BoxShape.circle : BoxShape.rectangle,
          color: Colors.yellow,
        ),
        width: _showSplash ? 800 : width, // Adjust width as needed
        height: _showSplash ? 800 : height, // Adjust height as needed
        duration: const Duration(seconds: 3),
        child: Center(
          child: _showSplash
              ? const Text(
                  'Camp Yellow',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              : const SizedBox(),
        ),
      ),
      splashIconSize: _showSplash ? 250 : 900,
      nextScreen: const LoginPage(),
      pageTransitionType: PageTransitionType.topToBottom,
      backgroundColor: Colors.white,
      duration: 5000,
      splashTransition: _showSplash
          ? SplashTransition.fadeTransition
          : SplashTransition.sizeTransition,
    );
  }
}
