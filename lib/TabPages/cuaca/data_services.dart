import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_uts/TabPages/cuaca/cuaca.dart';

class DataService {
  Future<Cuaca> fetchData(String cityName) async {
    try {
      //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
      final queryParameters = {
        'q': cityName,
        'appid': 'c89ca89337c57b0d931d77ff1f6b9460',
        'units': 'imperial'
      };
      final uri = Uri.http(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Cuaca.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Masukan Nama Kota');
      }
    } catch (e) {
      rethrow;
    }
  }
}
