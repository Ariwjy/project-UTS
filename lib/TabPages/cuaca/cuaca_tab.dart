import "package:flutter/material.dart";
import "package:project_uts/TabPages/cuaca/cuaca.dart";
import "package:project_uts/TabPages/cuaca/data_services.dart";

class CuacaTabPage extends StatefulWidget {
  const CuacaTabPage({super.key});

  @override
  State<CuacaTabPage> createState() => _CuacaTabPageState();
}

class _CuacaTabPageState extends State<CuacaTabPage> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Cuaca cuaca = Cuaca();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuaca'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFetch
                ? Column(
                    children: [
                      Image.network(
                          'https://openweathermap.org/img/wn/${cuaca.icon}@2x.png'),
                      Text(
                        '${cuaca.temp}°',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        cuaca.description,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  )
                : SizedBox(),
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 50),
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(labelText: 'Kota'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  isFetch = true;
                  cuaca = await dataService.fetchData(controller.text);
                  setState(() {});
                },
                child: Text('Cari'))
          ],
        ),
      ),
    );
  }
}
