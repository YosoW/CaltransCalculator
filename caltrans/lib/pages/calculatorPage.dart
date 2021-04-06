import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget{
  CalculatorPage({Key key}) : super(key: key);
  @override 
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {

  DatabaseReference _reference;

  TextEditingController nameFieldController, totalSizeValue,
  mulchRateValue, weightMulchValue, mixingRateValue, 
  capacityTankValue;

  Widget buildNameTextField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: nameFieldController,
        decoration: buildDecoration("Your Project Name:"),
        keyboardType: TextInputType.name,
      ),
    );
  }
  
  Widget buildTotalSizeField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField( 
        controller: totalSizeValue,
        decoration: buildDecoration("Total Size (sq.ft.)"),
        keyboardType: TextInputType.number,
      ),
      
    );
  }

  Widget buildMulchRateField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: mulchRateValue,
        decoration: buildDecoration("Mulch Application Rate (lbs/acre)"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildWeightMulchField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: weightMulchValue,
        decoration: buildDecoration("Weight of Mulch (lbs)"),
        keyboardType: TextInputType.number,
      ),
    );
  }
  Widget buildMixingRateField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: mixingRateValue,
        decoration: buildDecoration("Mulch Mixing Rate (lbs/100 gal)"),
        keyboardType: TextInputType.number,
      ),
    );
  }
  Widget buildCapacityTankField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: capacityTankValue,
        decoration: buildDecoration("Capacity of Tank (gal)"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Page'),
      ),
      body: Center(
        child: 
        Column(crossAxisAlignment:
         CrossAxisAlignment.stretch,
         children: <Widget>[
          buildNameTextField(), 
          buildTotalSizeField(),
          buildMulchRateField(),
          buildWeightMulchField(),
          buildMixingRateField(),
          buildCapacityTankField(),
          buildSubmitRow(),
         ],
        ),
      ),
    );

  }

  InputDecoration buildDecoration(String label){
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
    );
  }
  

  @override
  void initState(){
    super.initState();
    nameFieldController = TextEditingController();
    totalSizeValue = TextEditingController();
    mulchRateValue = TextEditingController();
    weightMulchValue = TextEditingController();
    mixingRateValue = TextEditingController();
    capacityTankValue = TextEditingController();
    reset();
    _reference = FirebaseDatabase.instance.reference().child("Projects");
  }
  @override
  void dispose(){
    nameFieldController.dispose();
    totalSizeValue.dispose();
    mulchRateValue.dispose();
    weightMulchValue.dispose();
    mixingRateValue.dispose();
    capacityTankValue.dispose();
    super.dispose();
  }

  /// Actions
  void reset() {
    nameFieldController.clear();
    totalSizeValue.clear();
    mulchRateValue.clear();
    weightMulchValue.clear();
    mixingRateValue.clear();
    capacityTankValue.clear();
  
  }
  
  void saveProject(){
    String name = nameFieldController.text;
    String size = totalSizeValue.text;
    String mulRV = mulchRateValue.text;
    String weightMulch= mulchRateValue.text;
    String mixRV = mixingRateValue.text;
    String tank = capacityTankValue.text;
    Map<String,String> project = {
      'nameOfProject' : name,
      'totalSizeValue' : size,
      'mulchRateValue' : mulRV,
      'weightMulchValue' : weightMulch,
      'mixingRateValue' : mixRV,
      'tank' : tank
    };

    _reference.push().set(project);
  }

  void display(){
    // final size = int.parse(totalSizeValue.text);

    final bagsPerTank = (int.parse(capacityTankValue.text) / (int.parse(weightMulchValue.text) * 100)) * int.parse(mixingRateValue.text);
    Text("$nameFieldController:\n $bagsPerTank bags per Tank");
  }

  Widget buildSubmitRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              saveProject();
            }, //Stores Project to new Page 
          ),
          SizedBox(
            width: 15.0,
          ),
          ElevatedButton(
            child: Text("Reset"),
            onPressed: () {
              setState(() {
                reset();
              });
            } ,
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}