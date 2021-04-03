import 'package:caltrans/pages/savedPage.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget{
  CalculatorPage({Key key}) : super(key: key);
  @override 
  CalculatorPageState createState() => CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage> {
  TextEditingController nameFieldController; 
  int totalSizeValue,
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
        decoration: buildDecoration("Total Size (sq.ft.)"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildMulchRateField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        decoration: buildDecoration("Mulch Application Rate (lbs/acre)"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildWeightMulchField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        decoration: buildDecoration("Weight of Mulch (lbs)"),
        keyboardType: TextInputType.number,
      ),
    );
  }
  Widget buildMixingRateField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        decoration: buildDecoration("Mulch Mixing Rate (lbs/100 gal)"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildCapacityTankField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
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
    reset();
  }
  @override
  void dispose(){
    nameFieldController.dispose();
    super.dispose();
  }

  /// Actions
  void reset() {
    nameFieldController.text = "";
    totalSizeValue = 0;
    mulchRateValue = 0;
    weightMulchValue = 0;
    mixingRateValue = 0;
    capacityTankValue = 0;
  }
  void updateTotalSize(int value){
    setState(() {
      totalSizeValue = value;
    });
  }
  void updateMulchRate(int value){
    setState(() {
      mulchRateValue = value;
    });
  }
  void updateWeightMulch(int value){
    setState(() {
      weightMulchValue = value;
    });
  }
  void updateMixingRate(int value){
    setState(() {
      mixingRateValue = value;
    });
  }
  void updateCapacityTank(int value){
    setState(() {
      capacityTankValue = value;
    });
  }

  Widget buildSubmitRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () => SavedPage(), //Stores Project to new Page 
          ),
          SizedBox(
            width: 15.0,
          ),
          ElevatedButton(
            child: Text("Reset"),
            onPressed: () => setState(reset),
          ),
          SizedBox(
            width: 15.0,
          ),
          // Expanded(
          //   child: Column(
          //     children: <Widget>[
          //       Text(_messageToUser, textAlign: TextAlign.center),
          //       _resultImage ?? SizedBox(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  // void storeProject(){

  // }
}