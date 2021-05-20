import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class weatherReport{

  Future<Weather> fetchWeather(String city) async{
    
    String baseURL = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations/=$city';

    var response = await http.get(
      Uri.parse(baseURL), 
      headers: {HttpHeaders.authorizationHeader: "pXUnXoLsPgNFqaynOxtRsdDEZDozPJgZ"},    
    );
    if(response != 200)
      throw Exception();

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