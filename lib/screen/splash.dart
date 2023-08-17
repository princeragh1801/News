import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.deepOrangeAccent,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(
              
              'assets/images/splash_pic.jpg',
              fit: BoxFit.cover,
              height: height*0.55,
              width: width*0.9,
              ),
              SizedBox(height: height*0.04,),
              Text('TOP HEADLINES', style: GoogleFonts.anton(letterSpacing: .6,color: Colors.grey.shade700),),
              SizedBox(height: height*0.04,),
              const SpinKitChasingDots(
                color: Colors.blue,
                size: 40,
              )
          ]),
        );
  }
}
