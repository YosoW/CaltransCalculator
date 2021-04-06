import 'package:caltrans/pages/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(CaltransApp());

class CaltransApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caltrans App',
    
      // theme: ThemeData(
      //   primarySwatch: Colors.teal,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomePage());
  }
}