import 'package:caltrans/pages/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(CaltransApp());

class CaltransApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caltrans App',
    
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomePage());
  }
}