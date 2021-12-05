import 'package:convertingdartmodelsintojson/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  List<User> _users = [];

  Future<void> fetchUsers() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    print(response.data);
    final List list = response.data;

    setState(() {
      _users = list.map((e) => User.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    fetchUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];

          return ListTile(
            title: Text(user.username),
            subtitle: Text(user.email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        tooltip: 'Fetch Users',
        child: Icon(Icons.data_usage),
      ),
    );
  }
}