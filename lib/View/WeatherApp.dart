import 'package:provider/provider.dart';
import 'package:weatherforecast/ViewModel/WeatherViewModel.dart';
import 'package:flutter/material.dart';
class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (create)=>WeatherViewModel(),child: _Weather(),) ;
  }
}
class _Weather extends StatefulWidget {
  const _Weather({Key? key}) : super(key: key);

  @override
  State<_Weather> createState() => _WeatherState();
}

class _WeatherState extends State<_Weather> {
  @override
  Widget build(BuildContext context) {
    final viewModel=Provider.of<WeatherViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),
      centerTitle: true,),
      body: Center(
        child: Container(
          width: 900,
          height: 400,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sunny),
                        Text('Temperature:-'+viewModel.temperature,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ],
                    )),
                Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.speed),
                        Text('Wind Speed :-'+viewModel.windaspeed,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      ],
                    )),
                Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.directions),
                        Text('Wind Direction :-'+viewModel.windDirection,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      ],
                    )),
                Container(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.watch_later),
                        Text('Time :-'+viewModel.time,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      ],
                    )),

          ]),
        ),
      ),
    );
  }
}

