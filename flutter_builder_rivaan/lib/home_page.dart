import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List usersList = [];

  addUsers() async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    http.Response res = await http.get(uri);
    var body = jsonDecode(res.body);
    for (var user in body) {
      usersList.add(user['name']);
    }
    return usersList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List from API'),
      ),
      body: FutureBuilder(
        future: addUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]),
                  leading: Text((index + 1).toString()),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
