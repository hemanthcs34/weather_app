// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'dart:ui';
import 'package:weather_app/widjets/weather_card.dart';
import 'package:weather_app/widjets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherServices = WeatherServices();
  final TextEditingController _controller =
      TextEditingController(); // Fixed naming convention
  bool _isLoading = false;
  Weather? _weather; // Fixed capitalization to match model class

  @override
  void dispose() {
    _controller.dispose(); // Add controller disposal
    super.dispose();
  }

  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await _weatherServices.featchWeather(_controller.text);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch weather data')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:
              _weather != null &&
                      _weather!.description.toLowerCase().contains('rain')
                  ? const LinearGradient(
                    colors: [Colors.grey, Colors.blueGrey],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : _weather != null &&
                      _weather!.description.toLowerCase().contains('clear')
                  ? const LinearGradient(
                    colors: [Colors.orange, Colors.blue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : const LinearGradient(
                    colors: [Colors.blue, Colors.lightBlueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 25), // Added const
                const Text(
                  // Added const
                  'Weather App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _controller, // Updated controller name
                  style: const TextStyle(
                    // Added const
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ), // Added hint style
                    filled: true,
                    fillColor: Color.fromARGB(244, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _getWeather,
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                if (_weather != null) WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
