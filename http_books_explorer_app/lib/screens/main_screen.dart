import 'package:flutter/material.dart';
import 'package:http_books_explorer/screens/book_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Books "),
      ),
      body: const BookListScreen(),
       drawer: Drawer(
        child: Container(
          color: Colors.amberAccent,
          child: Center(
            
          ),
        ),
      ),
    );
  }
}
