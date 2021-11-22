import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/Models/PostModel.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostsModel> list = [];

  getPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      list = postsModelFromJson(response.body);
      print(list[0].title);
      setState(() {
        
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: list.length == 0
          ? Container(
              child: Center(
                child: Text("Loading..."),
              ),
            )
          : ListView.builder(
              itemCount: list.length, itemBuilder: (context, i) {

                PostsModel model = list[i];

                return Column(children: [
                  Text(model.title)
                ],);

              }),
    );
  }
}
