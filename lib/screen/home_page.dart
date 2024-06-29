import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text("API sample")),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchUsers();
      }),
    );
  }
}

void fetchUsers() {
  print("fetch users called");
  final url='';
  final uri=Uri.parse(url);
  http.get(uri);
}
