import 'package:flutter/material.dart';
import 'screens/about.dart';
import 'screens/age.dart';
import 'screens/climaterd.dart';
import 'screens/gender.dart';
import 'screens/universities.dart';
import 'screens/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Couteaux App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToolboxHomePage(),
      routes: {
        '/genero': (context) => const GenderPage(),
        '/edad': (context) => const AgePredictionPage(),
        '/universidades': (context) => const UniversitiesPage(),
        '/clima': (context) => const ClimateRDPage(),
        '/noticias': (context) => const NewsPage(),
        '/acerca_de': (context) => const HireMePage(),
      },
    );
  }
}

class ToolboxHomePage extends StatefulWidget {
  @override
  _ToolboxHomePageState createState() => _ToolboxHomePageState();
}

class _ToolboxHomePageState extends State<ToolboxHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Couteaux App', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
      ),
      body: Container(
        color: Color.fromARGB(255, 0, 54, 98),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/toolbox.png'),
              // Gender prediction
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  void _onDrawerItemTap(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 54, 98),
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                    backgroundImage: AssetImage('assets/InWork.jpg'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                Icons.person_4,
                color: Colors.white,
              ),
              title: const Text(
                'Genero',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerItemTap(context, '/genero'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                Icons.auto_graph_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Edad',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerItemTap(context, '/edad'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                Icons.school,
                color: Colors.white,
              ),
              title: const Text(
                'Universidades',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerItemTap(context, '/universidades'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                Icons.wb_cloudy,
                color: Colors.white,
              ),
              title: const Text(
                'Clima',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerItemTap(context, '/clima'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                Icons.newspaper,
                color: Colors.white,
              ),
              title: const Text(
                'Posts',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerItemTap(context, '/noticias'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: const Text(
                'Acerca De',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerItemTap(context, '/acerca_de'),
            ),
          )
        ],
      ),
    );
  }
}
