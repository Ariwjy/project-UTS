import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:project_uts/Data/order.dart";
import 'package:project_uts/Screen/main_screen.dart';
import 'package:project_uts/TabPages/home_tab.dart';

class TerimaKasih extends StatefulWidget {
  @override
  State<TerimaKasih> createState() => _TerimaKasihState();
}

class _TerimaKasihState extends State<TerimaKasih> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Terima Kasih'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('asset/animation3.json', repeat: true),
              SizedBox(height: 20.0),
              Text(
                'Terima Kasih sudah menggunakan jasa kami!!',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      );
}
