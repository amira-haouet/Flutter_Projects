import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  var togglecall;
  Home({this.togglecall});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: widget.togglecall,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("$i Card"),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
