import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:lottie/lottie.dart';
class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        container(
          margin:  EdgeInsets.all(16),
          padding:  EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [



              Lottie.assest(
                weather.description.contains('rain')
                ? 'assets/rain.json'
                : weather.description.contains('clear')
                ? 'assets/sunny.json'
                : 'assets/cloudy.json',
                height: 150,
                width: 150,
              ),
              Text(
                weather.cityName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )



              SizedBox(height: 10,),

              Text(
               ''${ weather.temperature.toStringAsFixed(1)}°C',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontweight: FontWeight.bold),
              )




              SizedBox(height: 10,),


              Text(
                weather.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text(
                'Humidity: ${weather.humidity}%',
                style: Theme.of(context).textTheme.bodyMedium,
                  )
                    ],
                  ),



              SizedBox(height: 20,),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Icon(
                  Icons.wb_sunny,
                  color: Colors.orange,
                ),
                Text(
                'Humidity: ${weather.humidity}%',
                style: Theme.of(context).textTheme.bodyMedium,
                  )
                    ],
                  ),
                ],
              ),
            ],
          )
        )
      ],
    );