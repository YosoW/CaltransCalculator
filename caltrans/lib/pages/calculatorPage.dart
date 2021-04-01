import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget{
  CalculatorPage({Key key}) : super(key: key);
  @override 
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Page'),
      ),

    );
    
  }
}