
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:caltrans/models/weatherInfo.dart';
import 'package:caltrans/services/api_manager.dart';
import 'package:flutter/material.dart';


class WeatherPage extends StatefulWidget{
  WeatherPage({Key key}) : super(key: key);
  @override 
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {

   // ignore: missing_required_param
   static Position _location = Position(latitude: 0.0, longitude: 0.0);
   WeatherData weatherData;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Weather'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: weatherData != null ? Weather(weather: weatherData) : Container(
                    )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: new Icon(Icons.refresh),
                  tooltip: 'Refresh',
                  onPressed:(){ 
                     setState(() {
                      fetchWeather();  
                     });
                  },
                  color: Colors.white,
                ),
              ),
              ],
          ),
        ),
      );
   }


   @override
   void initState() {
     super.initState();
     fetchWeather();
   }

  // Future<WeatherData> fetchWeather() async{
  //    final location = await Geolocator.getCurrentPosition(
  //        desiredAccuracy: LocationAccuracy.high);
  //   //  setState(() {
  //      _location = location;
  //   //  }
  //   // );
  //   final url = 'https://api.weather.gov/points/${_location.latitude},${_location.longitude}';
 
  //   final response = await http.get(
  //     Uri.parse(url), 
  //   );
    
  //   if (response.statusCode != 200)
  //     throw Exception();
  //     final mainUrl = json.decode(response.body)['properties']['forecastHourly'];
  //     final mainResponse = await http.get(mainUrl);
  //    if (mainResponse.statusCode != 200)
  //      throw Exception();



  //   var responseJson = jsonDecode(response.body);
  //   return WeatherData.fromJson(responseJson);
  // }


   fetchWeather() async {
     final location = await Geolocator.getCurrentPosition(
         desiredAccuracy: LocationAccuracy.high);
     setState(() {
       _location = location;
     });

     final url = 'https://api.weather.gov/points/${_location.latitude},${_location.longitude}';
     final response = await http.get(Uri.parse(url));
     if (response.statusCode != 200)
       throw Exception();
     final mainUrl = json.decode(response.body)['properties']['forecastHourly'];
     final mainResponse = await http.get(Uri.parse(mainUrl));
     if (mainResponse.statusCode != 200)
       throw Exception();
    //  return setState(() {
       weatherData =  new WeatherData.fromJson(json.decode(mainResponse.body));
    //  });
    return weatherData;
   }
}



  // void reset() {
  //   cityName.clear();
  //   zipCode.clear();
  // }

  // Widget buildCityField(){
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
  //     child: TextField(
  //       controller: cityName,
  //       decoration: buildDecoration("City Name"),
  //       keyboardType: TextInputType.number,
  //     ),
  //   );
  // }

  // Widget buildZipCodeField(){
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
  //     child: TextField(
  //       controller: zipCode,
  //       decoration: buildDecoration("Zip Code"),
  //       keyboardType: TextInputType.number,
  //     ),
  //   );
  // }
  // InputDecoration buildDecoration(String label){
  //   return InputDecoration(
  //     labelText: label,
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(14.0)),
  //     ),
  //   );
  // }

  // Future<Weather> fetchWeather(String city) async{
    
  //   String baseURL = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations/=$city';
  //   // String baseURLZipCode = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations?locationcategoryid=ZIP&sortfield=name&sortorder=desc';
    
  //   var response = await http.get(
  //     Uri.parse(baseURL), 
  //     headers: {HttpHeaders.authorizationHeader: "pXUnXoLsPgNFqaynOxtRsdDEZDozPJgZ"},    
  //   );
  //   // if(response != 200)
  //   //   throw Exception();

    // var responseJson = jsonDecode(response.body);
  //   // print("Resonse staturs: ${response.statusCode}");
    
  //   return Weather.fromJson(responseJson);
  // }


// class Weather {
//   final double temp;
//   final double feelsLike;
//   final double tempMin;
//   final double tempMax;
//   final int pressure;
//   final int humidity;

//   Weather(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.humidity});

//   factory Weather.fromJson(dynamic json) {
//     if (json == null) {
//       return Weather();
//     }

//     return Weather(
//       temp: json['temp'],
//       feelsLike: double.parse(json['feels_like'].toString()),
//       tempMin: json['temp_min'],
//       tempMax: json['temp_max'],
//       pressure: json['pressure'],
//       humidity: json['humidity'],
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:geolocator/geolocator.dart';
// import 'package:caltrans/models/weatherInfo.dart';
// import 'package:caltrans/services/api_manager.dart';
// import 'package:flutter/material.dart';

// class WeatherPage extends StatefulWidget{
//   ({Key key}) : super(key: key);
//   @override 
//   AccountPageState createState() => AccountPageState();
// }

// class AccountPageState extends State<AccountPage> {
//   TextEditingController cityName, zipCode;

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       // backgroundColor: Color(0xFF2D2F41),
//       appBar: AppBar(
//         title: Text('Weather Stats'),
//       ),

//       body: Column(
//         children: [
//           buildCityField(),
//           buildZipCodeField(),
//         ],
//       ),
      
//     );
//   }
//     @override
//   void initState(){
//     super.initState();
//     cityName = TextEditingController();
//     zipCode = TextEditingController();
//     reset();
//   }
//   @override
//   void dispose(){
//     cityName.dispose();
//     zipCode.dispose();
//     super.dispose();
//   }

//   void reset() {
//     cityName.clear();
//     zipCode.clear();
//   }

//   Widget buildCityField(){
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//       child: TextField(
//         controller: cityName,
//         decoration: buildDecoration("City Name"),
//         keyboardType: TextInputType.number,
//       ),
//     );
//   }

//   Widget buildZipCodeField(){
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//       child: TextField(
//         controller: zipCode,
//         decoration: buildDecoration("Zip Code"),
//         keyboardType: TextInputType.number,
//       ),
//     );
//   }
//   InputDecoration buildDecoration(String label){
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(14.0)),
//       ),
//     );
//   }

  // Future<Weather> fetchWeather(String city) async{
    
  //   String baseURL = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations/=$city';
  //   // String baseURLZipCode = 'https://www.ncdc.noaa.gov/cdo-web/api/v2/locations?locationcategoryid=ZIP&sortfield=name&sortorder=desc';
    
  //   var response = await http.get(
  //     Uri.parse(baseURL), 
  //     headers: {HttpHeaders.authorizationHeader: "pXUnXoLsPgNFqaynOxtRsdDEZDozPJgZ"},    
  //   );
  //   // if(response != 200)
  //   //   throw Exception();

  //   var responseJson = jsonDecode(response.body);
  //   // print("Resonse staturs: ${response.statusCode}");
    
  //   return Weather.fromJson(responseJson);
  // }
// }

// class Weather {
//   final double temp;
//   final double feelsLike;
//   final double tempMin;
//   final double tempMax;
//   final int pressure;
//   final int humidity;

//   Weather(
//       {this.temp,
//       this.feelsLike,
//       this.tempMin,
//       this.tempMax,
//       this.pressure,
//       this.humidity});

//   factory Weather.fromJson(dynamic json) {
//     if (json == null) {
//       return Weather();
//     }

//     return Weather(
//       temp: json['temp'],
//       feelsLike: double.parse(json['feels_like'].toString()),
//       tempMin: json['temp_min'],
//       tempMax: json['temp_max'],
//       pressure: json['pressure'],
//       humidity: json['humidity'],
//     );
//   }
// }