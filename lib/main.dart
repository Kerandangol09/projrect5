import 'package:flutter/material.dart';
import 'package:http_call/List.dart';

void main() => runApp(List());
class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " Http Call Demo",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ListPage(),
    );
  }
}