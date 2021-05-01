import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercise1Page extends StatefulWidget {
  @override
  _Exercise1PageState createState() => _Exercise1PageState();
}

class _Exercise1PageState extends State<Exercise1Page> {
  int _number = 0;
  bool _evenOdd = true;

  AppBar _appBar() {
    return AppBar(title: Text("HomeWork Exercise 1"));
  }

  Widget _body() {
    return Container(
        child: Center(
            child: Text("Number: $_number",
                style: _evenOdd
                    ? TextStyle(fontSize: 30, color: Colors.green)
                    : TextStyle(fontSize: 30, color: Colors.black))));
  }

  Widget _fabIncrement() {
    return FloatingActionButton.extended(
      onPressed: _incrementNumber,
      label: Text("Increment"),
      icon: Icon(Icons.exposure_plus_1),
    );
  }

  Widget _falDecrement() {
    return FloatingActionButton.extended(
      onPressed: _decrementNumber,
      label: Text("Decrement"),
      icon: Icon(Icons.exposure_minus_1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _body(),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_fabIncrement(), SizedBox(height: 15), _falDecrement()],
        ));
  }

  _gettingEvenOdd(int _number) {
    bool cases;

    if (_number % 2 == 0) {
      cases = true;
    } else {
      cases = false;
    }
    return cases;
  }

  void _incrementNumber() {
    _number++;
    _evenOdd = _gettingEvenOdd(_number);
    setState(
        () {}); //hace que se cuando se termine la funcion se reinicie todo lo que permite el aumento en tiempo real sin necesidad de recargar la app
  }

  void _decrementNumber() {
    _number--;
    if (_number < 0) {
      _number = 0;
    }
    _evenOdd = _gettingEvenOdd(_number);
    setState(
        () {}); //hace que se cuando se termine la funcion se reinicie todo lo que permite el aumento en tiempo real sin necesidad de recargar la app
  }
} //close the class
