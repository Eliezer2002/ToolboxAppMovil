import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePredictionPage extends StatefulWidget {
  const AgePredictionPage({super.key});


  @override
  _AgePredictionPageState createState() => _AgePredictionPageState();
}

class _AgePredictionPageState extends State<AgePredictionPage> {
  String name = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Predecir Edad', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    fetchData();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 54, 98)),
                  ),
                  child: Text('Calcular Edad', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (age > 0)
              Column(
                children: [
                  Text(
                    'Edad: $age',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  if (age < 18)
                    Column(
                      children: [
                        Image(image: AssetImage('assets/InWork.jpg')),
                      ],
                    ),
                  if (age >= 18 && age < 60)
                    Column(
                      children: [
                        Image(image: AssetImage('assets/InWork.jpg')),
                      ],
                    ),
                  if (age >= 60)
                    Column(
                      children: [
                        Image(image: AssetImage('assets/InWork.jpg')),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://api.agify.io/?name=${name.toLowerCase()}'));
    final data = jsonDecode(response.body);
    setState(() {
      if (data['age'] != null) {
        age = data['age'];
      } else {
        age = 0; // Otra edad predeterminada si la respuesta es nula
      }
    });
  }
}
