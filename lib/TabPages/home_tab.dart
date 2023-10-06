import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_uts/SplashScreen/finding_driver.dart';
import 'package:project_uts/data/lokasi.dart';
import 'package:project_uts/data/user_data.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:async';
import 'package:project_uts/tabPages/harga_tab.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  String? selectedType;
  String? pickupLocation;
  String? dropOffLocation;
  double motorPrice = 35000.0;
  double mobilPrice = 45000.0;
  double saldo = 0.0;
  TextEditingController topUpController = TextEditingController();

  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

  Future<DecorationImage> _loadBackgroundImage() async {
    ByteData data = await rootBundle.load('Images/background_home.jpg');
    List<int> bytes = data.buffer.asUint8List();
    return DecorationImage(
      image: MemoryImage(Uint8List.fromList(bytes)),
      fit: BoxFit.cover,
    );
  }

  void _onConfirmPressed() {
    if (selectedType != null) {
      print("Selected Vehicle Type: $selectedType");

      double selectedPrice = selectedType == 'Motor' ? motorPrice : mobilPrice;

      print("Harga Kendaraan: $selectedPrice");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HargaTabPage(
            pickupLocation: pickupLocation,
            dropOffLocation: dropOffLocation,
            selectedPrice: selectedPrice,
            saldo: saldo,
            updateSaldo: (double newSaldo) {},
          ),
        ),
      );
    } else {
      print("Please select a vehicle type.");
    }
  }

  Future<void> _selectLocation(
      BuildContext context, String locationType) async {
    TextEditingController locationController1 = TextEditingController();
    TextEditingController locationController2 = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select $locationType Location'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (locationType == 'Pickup')
                TextField(
                  controller: locationController1,
                  decoration:
                      InputDecoration(labelText: 'Masukan Titik Pick-up'),
                ),
              if (locationType == 'Drop-off')
                TextField(
                  controller: locationController2,
                  decoration:
                      InputDecoration(labelText: 'Masukan Titik Drop-Off'),
                ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
                if (locationType == 'Pickup') {
                  setState(() {
                    Lokasi.TitikJemput = locationController1.text;
                  });
                }
                if (locationType == 'Drop-off') {
                  setState(() {
                    Lokasi.TitikAntar = locationController2.text;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showTopUpDialog() {
    TextEditingController topUpAmountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Top Up'),
          content: TextField(
            controller: topUpAmountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Top Up (Rp)'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Top Up'),
              onPressed: () {
                if (topUpAmountController.text.isNotEmpty) {
                  double topUpAmount = double.parse(topUpAmountController.text);
                  setState(() {
                    saldo += topUpAmount;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadBackgroundImage(),
      builder: (context, AsyncSnapshot<DecorationImage> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Hello! ${UserData.username} ${UserData.username1}'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Bonceng Pay: Rp $saldo',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.monetization_on),
                        onPressed: _showTopUpDialog,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                image: snapshot.data,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {
                              // Add the functionality for the comment button here
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () {
                              // Add the functionality for the bell button here
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Pilih Jenis Kendaraan:",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      DropdownButton<String>(
                        value: selectedType,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedType = newValue;
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: "Motor",
                            child: Text("Motor"),
                          ),
                          DropdownMenuItem<String>(
                            value: "Mobil",
                            child: Text("Mobil"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () => _selectLocation(context, 'Pickup'),
                        child: Text("Pilih Titik Jemput"),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () => _selectLocation(context, 'Drop-off'),
                        child: Text("Pilih Titik Antar"),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: _onConfirmPressed,
                        child: Text("Confirm"),
                      ),
                      SizedBox(height: 20.0),
                      LottieBuilder.asset('asset/animation2.json',
                          repeat: true),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Hello! ${UserData.username} ${UserData.username1}'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Bonceng Pay: Rp $saldo',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      IconButton(
                        icon: Icon(Icons.monetization_on),
                        onPressed: _showTopUpDialog,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
