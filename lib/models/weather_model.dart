class weather {
  final String cityName;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int sunrise;
  final int sunset;

  weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
  });


  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(
      cityName: json['name'],
      temperature: json['main']['temp'] -273.15,
      description: json['weather']['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
