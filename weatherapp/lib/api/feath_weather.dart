
import 'dart:convert';

import 'package:weatherapp/api/api_key.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_data_current.dart';


class FeathchWeatherAppi{

   WeatherData? weatherData;


  //prossiing the data form respose to json 

  Future<WeatherData> prosseseData({required double lat,required double lon})async{

    Uri uri = Uri.parse(apiURL(lat: lat, lon: lon));

   http.Response response = await http.get(uri);
  Map<String ,dynamic> jsonString = jsonDecode(response.body);


    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    return weatherData!;
  }

}

String apiURL({required double lat,required double lon}){

  // String apiUrl = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&units=metric";
  String apiUrl = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&units=metric";

  return apiUrl;
  
}