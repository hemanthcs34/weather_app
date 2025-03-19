
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherServices {
  final String apiKey = 'fe268595f0927c975c09d0b3271fdf6c';

  Future<Weather> featchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    final response = await http.get(url);



    if (response.statusCode == 200) {
      return Weather.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
