import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget{
  SavedPage({Key key}) : super(key: key);

  @override 
  SavedPageState createState() => SavedPageState();
}

class SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Projects Page'),
      ),
    );
  }
}