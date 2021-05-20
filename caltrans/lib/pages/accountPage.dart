import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget{
  AccountPage({Key key}) : super(key: key);
  @override 
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  TextEditingController cityName, zipCode;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // backgroundColor: Color(0xFF2D2F41),
      appBar: AppBar(
        title: Text('Weather Stats'),
      ),

      body: Column(
        children: [
          buildCityField(),
          buildZipCodeField(),
        ],
      ),
      
    );
  }
    @override
  void initState(){
    super.initState();
    cityName = TextEditingController();
    zipCode = TextEditingController();
    reset();
  }
  @override
  void dispose(){
    cityName.dispose();
    zipCode.dispose();
    super.dispose();
  }

  void reset() {
    cityName.clear();
    zipCode.clear();
  }

  Widget buildCityField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: cityName,
        decoration: buildDecoration("City Name"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget buildZipCodeField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: TextField(
        controller: zipCode,
        decoration: buildDecoration("Zip Code"),
        keyboardType: TextInputType.number,
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

  Future<Weather> fetchWeather(String city) async{
    
    String baseURL = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations/=$city';
    // String baseURLZipCode = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations?locationcategoryid=ZIP&sortfield=name&sortorder=desc';
    
    var response = await http.get(
      Uri.parse(baseURL), 
      headers: {HttpHeaders.authorizationHeader: "pXUnXoLsPgNFqaynOxtRsdDEZDozPJgZ"},    
    );
    // if(response != 200)
    //   throw Exception();

    var responseJson = jsonDecode(response.body);
    // print("Resonse staturs: ${response.statusCode}");
    
    return Weather.fromJson(responseJson);
  }
}

class Weather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Weather(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory Weather.fromJson(dynamic json) {
    if (json == null) {
      return Weather();
    }

    return Weather(
      temp: json['temp'],
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}