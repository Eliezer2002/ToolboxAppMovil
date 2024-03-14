import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String name = '';
  String gender = '';

  Future<void> fetchData() async {
    final nameResponse =
        await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    setState(() {
      gender =
          jsonDecode(nameResponse.body)['gender'] == 'male' ? 'male' : 'female';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Genero', style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
                fetchData();
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          gender == 'male'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hombre',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                      height: 30,
                      width: 30,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Mujer',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(50)),
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
