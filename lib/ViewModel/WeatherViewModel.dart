import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weatherforecast/Repository/APIService.dart';

class WeatherViewModel extends ChangeNotifier{
  String temperature="fetching";
  String windaspeed="feching";
  String time="fetching";
  String windDirection="fetching";
  late Timer _timer;
  WeatherViewModel(){
    _timer=Timer.periodic(Duration(seconds: 1), (Timer t) {
      getData();
    });

  }

  Future<void> getData() async{
    Map<String,dynamic> weatherData= await APIService().fetchData();
    temperature=weatherData['temperature'];
    windaspeed=weatherData['windspeed'];
    windDirection=weatherData['windDirection'];
    time=weatherData['time'];
    notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

}