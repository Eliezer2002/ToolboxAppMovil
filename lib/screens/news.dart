import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:tarea6/clases/noticias.dart';




class NewsPage extends StatefulWidget {
  const NewsPage({super.key});


  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://about.fb.com/wp-json/wp/v2/posts'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      setState(() {
        posts = jsonData.take(3).map((data) => Post.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load posts');
    }
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
        backgroundColor: Color.fromARGB(255, 0, 54, 98),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Posts', style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/Logo.jpg'),
            title: Text(posts[index].title),
            subtitle: Text(posts[index].summary),
            onTap: () {
              final url = posts[index].url;
              launchUrl(url);
            },
          );
        },
      ),
    );
  }
}
