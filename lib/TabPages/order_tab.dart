import 'package:flutter/material.dart';
import 'package:project_uts/SplashScreen/TerimaKasih.dart';
import 'package:project_uts/SplashScreen/TerimaKasih.dart';
import 'package:project_uts/Data/lokasi.dart';
import 'package:project_uts/TabPages/harga_tab.dart';

class OrderTabPage extends StatefulWidget {
  final String? pickupLocation;
  final String? dropOffLocation;
  final String? selectedType;
  final double? selectedPrice;

  const OrderTabPage({
    Key? key,
    this.pickupLocation,
    this.dropOffLocation,
    this.selectedType,
    this.selectedPrice,
  }) : super(key: key);

  @override
  State<OrderTabPage> createState() => _OrderTabPageState();
}

class _OrderTabPageState extends State<OrderTabPage> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titik Jemput:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              '${Lokasi.TitikJemput}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Titik Antar:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              '${Lokasi.TitikAntar}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat anda sudah mendapatkan driver',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Image(
                    image: AssetImage('Images/profile_driver.jpg'),
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Nama: Joko',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'No. Plat: B 123 IDP',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total harga: ${widget.selectedPrice}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman PesananSelesai
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TerimaKasih()),
                      );
                    },
                    child: Text('Pesanan Selesai'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
