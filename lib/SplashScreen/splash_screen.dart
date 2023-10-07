import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_uts/authentication/login.dart';
import 'package:project_uts/authentication/signup.dart';
import 'package:project_uts/Screen/main_screen.dart';

class MySpalshScreen extends StatefulWidget {
  const MySpalshScreen({Key? key}) : super(key: key);

  @override
  _MySpalshScreenState createState() => _MySpalshScreenState();
}

class _MySpalshScreenState extends State<MySpalshScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      // send user to main screen
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Container(
            color: Colors.white,
          ),
          // Overlayed Image
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "Images/bonceng.jpg",
                  width: 600.0, // Adjust width as needed
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Zaman sekarang masih cape nyetir sendiri? Bonceng-in aja",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
