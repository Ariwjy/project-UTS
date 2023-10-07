import "package:flutter/material.dart";
import "package:flutter_rating_bar/flutter_rating_bar.dart";
import "package:project_uts/Data/lokasi.dart";
import "package:project_uts/SplashScreen/TerimaKasih.dart";
import "package:project_uts/TabPages/home_tab.dart";
import "package:project_uts/TabPages/order_tab.dart";

class PesananSelesai extends StatefulWidget {
  final double? selectedPrice;
  final String? pickupLocation;
  final String? dropOffLocation;
  const PesananSelesai(
      {super.key,
      this.selectedPrice,
      this.pickupLocation,
      this.dropOffLocation});

  @override
  State<PesananSelesai> createState() => _PesananSelesaiState();
}

class _PesananSelesaiState extends State<PesananSelesai> {
  get selectedPrice => widget.selectedPrice;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff190E45),
              Color(0xff5339A5),
              Color(0xff5E43AE),
            ]),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Text("Bill Kamu"),
            centerTitle: true,
            actions: [
              TextButton(
                child: Text(
                  "Bantuan?",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        preferredSize: Size(_size.width, 50),
      ),
      body: Container(
        height: _size.height,
        width: _size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "Images/complete.png",
                    width: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Perjalanan selesai",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Rp ${widget.selectedPrice}",
              style: TextStyle(fontSize: 40, color: const Color(0xff3C2593)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Icon(
                        Icons.my_location,
                        color: Colors.green,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${Lokasi.TitikJemput}',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Icon(
                        Icons.near_me,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${Lokasi.TitikAntar}',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              "Bagaimana perjalananmu?",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (_size.width * 0.5) - 62,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "Images/profile_driver.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TerimaKasih()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff172840),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text("Done"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
