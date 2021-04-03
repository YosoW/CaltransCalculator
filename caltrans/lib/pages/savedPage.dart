import 'package:flutter/material.dart';

class SavedPage extends StatefulWidget{
  // String projectName;
  // SavedPage({Key key, @required this.projectName}) : super(key: key);

  // @override 
  // SavedPageState createState() => SavedPageState(projectName);
  @override 
  SavedPageState createState() => SavedPageState();
} 
 
class SavedPageState extends State<SavedPage> {
  // String projectName;
  // SavedPageState(this.projectName);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Projects Page'),
        ),

        body:
         Column(
          children: [
            Text("..."),
          ],

        ),
    );
  }
}