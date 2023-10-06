import 'package:flutter/material.dart';
import 'package:project_uts/SplashScreen/finding_driver.dart';
import 'package:project_uts/data/lokasi.dart';

typedef void UpdateSaldo(double newSaldo);

class HargaTabPage extends StatefulWidget {
  final String? pickupLocation;
  final String? dropOffLocation;
  final double? selectedPrice;
  final double? saldo;
  final UpdateSaldo updateSaldo;

  const HargaTabPage(
      {Key? key,
      this.pickupLocation,
      this.dropOffLocation,
      this.selectedPrice,
      String? selectedPayment,
      required this.saldo,
      required this.updateSaldo})
      : super(key: key);

  @override
  State<HargaTabPage> createState() => _HargaTabPageState();
}

class _HargaTabPageState extends State<HargaTabPage> {
  String? selectedPayment;

  get selectedPrice => widget.selectedPrice;

  @override
  Widget build(BuildContext context) {
    double saldo = widget.saldo ?? 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pickup Location: ${Lokasi.TitikJemput}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Drop-off Location: ${Lokasi.TitikAntar}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Harga Kendaraan: ${widget.selectedPrice}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Pilih Metode Pembayaran:',
              style: TextStyle(fontSize: 18),
            ),
            ListTile(
              title: const Text('Gopay'),
              leading: Radio(
                value: 'Gopay',
                groupValue: selectedPayment,
                onChanged: (value) {
                  setState(() {
                    selectedPayment = value as String?;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Ovo'),
              leading: Radio(
                value: 'Ovo',
                groupValue: selectedPayment,
                onChanged: (value) {
                  setState(() {
                    selectedPayment = value as String?;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Cash'),
              leading: Radio(
                value: 'Cash',
                groupValue: selectedPayment,
                onChanged: (value) {
                  setState(() {
                    selectedPayment = value as String?;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Bonceng Pay'),
              leading: Radio(
                value: 'Bonceng',
                groupValue: selectedPayment,
                onChanged: (value) {
                  setState(() {
                    selectedPayment = value as String?;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedPayment == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Silahkan pilih metode pembayaran terlebih dahulu'),
                    ),
                  );
                } else {
                  if (selectedPayment == 'Bonceng') {
                    double selectedPrice = widget.selectedPrice ?? 0.0;
                    if (saldo >= selectedPrice) {
                      setState(() {
                        saldo -= selectedPrice;
                      });
                      widget.updateSaldo(saldo);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Saldo Bonceng Pay tidak mencukupi.'),
                        ),
                      );
                      return;
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FindingDriver(selectedPrice: selectedPrice),
                    ),
                  );
                }
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
