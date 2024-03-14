import 'package:flutter/material.dart';

class HireMePage extends StatelessWidget {
  const HireMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
        title: const Text('Acerca De', style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          CircleAvatar(
            radius: 200,
            backgroundImage: AssetImage("assets/InWork.jpg"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Nombre'),
            subtitle: const Text('Eliezer Vargas Gomez'),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Correo electrónico'),
            subtitle: const Text('eliezervargasgomez23@gmail.com'),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Número de teléfono'),
            subtitle: const Text('+1-809-854-3342'),
            onTap: () {
              // Lógica para llamar al número de teléfono
            },
          )
        ],
      ),
    );
  }
}

