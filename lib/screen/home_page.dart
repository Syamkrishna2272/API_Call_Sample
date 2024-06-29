import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text("API sample")),
      ),
      body: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            final users = user[index];
            final name = users["name"]['first'];
            final email = users["email"];
            final imageurl = users["picture"]['thumbnail'];
            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(imageurl)),
              title: Text(name),
              subtitle: Text(email),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchUsers();
      }),
    );
  }

  void fetchUsers() async {
    print("fetch users called");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      user = json['results'];
    });
    print("fetch users completed");
  }
}
