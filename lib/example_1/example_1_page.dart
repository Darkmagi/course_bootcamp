import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example1Page extends StatefulWidget {
  @override
  _Example1PageState createState() => _Example1PageState();
}

class _Example1PageState extends State<Example1Page> {
  AppBar _appBar() {
    return AppBar(title: Text("Example 1"));
  }

  Widget _body() {
    return Container(
        child: Center(
            child: Text("Hello Word",
                style: TextStyle(fontSize: 30, color: Colors.blue))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
}
