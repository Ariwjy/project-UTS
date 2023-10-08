import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riwayat Pesanan Transportasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderHistoryPage(),
    );
  }
}

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pesanan Transportasi'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Pesanan ${orders[index].orderNumber}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Detail Pesanan',
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailPage(order: orders[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class OrderDetailPage extends StatelessWidget {
  final Order order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tanggal           : ${order.date}',
            ),
            Text(
              'Titik Jemput   : ${order.pickupLocation}',
            ),
            Text(
              'Titik Antar       : ${order.destination}',
            ),
            Text(
              'Nama Driver   : ${order.driverName}',
            ),
            Text(
              'Jenis               : ${order.jeniskendaraan}',
            ),
            Text(
              'No.Plat            : ${order.noplat}',
            ),
            Text('Harga              : \Rp.${order.price.toStringAsFixed(2)}'),
            // Tambahkan peta lokasi penjemputan dan tujuan di sini
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali ke Riwayat Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  final int orderNumber;
  final String date;
  final String pickupLocation;
  final String destination;
  final String driverName;
  final String jeniskendaraan;
  final String noplat;
  final double price;

  Order({
    required this.orderNumber,
    required this.date,
    required this.pickupLocation,
    required this.destination,
    required this.driverName,
    required this.jeniskendaraan,
    required this.noplat,
    required this.price,
  });
}

final List<Order> orders = [
  Order(
    orderNumber: 1,
    date: '07 Oktober 2023',
    pickupLocation: 'Jl. Jelambar, wijaya Kusuma',
    destination: 'Poris Paradise 2 Blok B3 No.18',
    driverName: 'Joko',
    jeniskendaraan: 'Motor',
    noplat: 'B 123 IDP',
    price: 35000.0,
  ),
  Order(
    orderNumber: 2,
    date: '08 Oktober 2023',
    pickupLocation: 'Jl. Daan Mogot Raya',
    destination: 'Tanggerang',
    driverName: 'Joko',
    jeniskendaraan: 'Mobil',
    noplat: 'B 123 IDP',
    price: 45000.0,
  ),
];
