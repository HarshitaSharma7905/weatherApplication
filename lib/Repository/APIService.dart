import 'dart:convert';

import 'package:http/http.dart'as http;

import '../Model/WeatherModel.dart';
class APIService{
  Future<Map<String,dynamic>> fetchData() async{
    String url="https://api.open-meteo.com/v1/forecast?latitude=26.7505&longitude=83.3634&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final Map<String,dynamic> jsonData=jsonDecode(response.body);
      final weatherForecastData = jsonData['current_weather'];
      final hourlyWeatherData = jsonData['hourly'];
      final weathetforecast=CurrentWeather.fromJson(weatherForecastData);
      final hourlyWeather=Hourly.fromJson(hourlyWeatherData);
      final temperature=weathetforecast.temperature.toString();
      final windspeed=weathetforecast.windspeed.toString();
      final windDirection=weathetforecast.winddirection.toString();
      final time=weathetforecast.time.toString();
      Map<String,dynamic> weatherdata={'temperature':temperature,'windspeed':windspeed,'windDirection':windDirection,'time':time};
      return weatherdata;
    }else
      {
        return {'temperature':'No Data','windspeed':'No Data','windDirection':'No Data','time':'No Data'};
      }
  }

}