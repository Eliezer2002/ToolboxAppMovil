
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimateRDPage extends StatefulWidget {
  const ClimateRDPage({super.key});

  @override
  _ClimateRDPage createState() => _ClimateRDPage();
}

class _ClimateRDPage extends State<ClimateRDPage> {
  Weather weather = Weather(cityName: '', temperature: 0.0);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final weatherResponse = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=d666a8317af347818f511745240803&q=Santo%20Domingo'));

    setState(() {
      weather = Weather.fromJson(jsonDecode(weatherResponse.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Clima', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: weather != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Clima en ${weather.cityName}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${weather.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}




class Weather {
  final String cityName;
  final double temperature;

  Weather({
    required this.cityName,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['location']['name'] ?? '',
      temperature: double.parse(json['current']['temp_c'].toString()),
    );
  }
}