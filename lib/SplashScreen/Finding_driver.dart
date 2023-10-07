import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:project_uts/TabPages/order_tab.dart";

class FindingDriver extends StatefulWidget {
  final double? selectedPrice;
  const FindingDriver(
      {super.key,
      String? pickupLocation,
      String? dropOffLocation,
      String? selectedType,
      this.selectedPrice});

  @override
  State<FindingDriver> createState() => _FindingDriverState();
}

class _FindingDriverState extends State<FindingDriver> {
  get selectedPrice => widget.selectedPrice;

  @override
  void initState() {
    super.initState();
    // Tambahkan penundaan selama 5 detik sebelum pindah ke OrderTabPage
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OrderTabPage(
                  selectedPrice: selectedPrice,
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('asset/finding_driver.json'),
              SizedBox(height: 20.0),
              Text(
                'Sedang mencari driver...',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      );
}
