import "dart:async";

import "package:flutter/material.dart";
import 'package:project_uts/authentication/login.dart';
import 'package:project_uts/authentication/signup.dart';
import 'package:project_uts/Screen/main_screen.dart';

class MySpalshScreen extends StatefulWidget {
  const MySpalshScreen({super.key});

  @override
  _MySpalshScreenState createState() => _MySpalshScreenState();
}

class _MySpalshScreenState extends State<MySpalshScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      //send user to main screen
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
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("Images/logo1.png"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Zaman sekarang masih cape nyetir sendiri? Bonceng-in aja",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
