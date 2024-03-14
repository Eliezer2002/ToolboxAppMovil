import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:tarea6/clases/universidades.dart';


class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({super.key});


  @override
  _UniversitiesPageState createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  String countryName = '';
  List<University> universities = [];

  Future<void> fetchData() async {
    final universityResponse = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=$countryName'));

    setState(() {
      final universitiesJson =
          jsonDecode(universityResponse.body) as List<dynamic>;
      universities =
          universitiesJson.map((json) => University.fromJson(json)).toList();
    });
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades', style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Nombre del país',
              ),
              onChanged: (value) {
                setState(() {
                  countryName = value.trim();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: universities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(universities[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dominio: ${universities[index].domain}'),
                      Text('Página web: ${universities[index].webPage}'),
                    ],
                  ),
                  onTap: () {
                    final url = universities[index].webPage;
                    launchUrl(url);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        tooltip: 'Buscar Universidades',
        child: const Icon(Icons.search),
      ),
    );
  }
}
