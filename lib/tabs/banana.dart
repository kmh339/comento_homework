import 'package:flutter/material.dart';

class Banana extends StatefulWidget {
  Banana({
    Key key,
  }) : super(key: key);

  @override
  _BananaState createState() => _BananaState();
}

class _BananaState extends State<Banana> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("hi"),
        ),
      ),
    );
  }
}
