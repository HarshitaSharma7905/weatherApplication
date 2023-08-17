import 'package:flutter/material.dart';
import 'package:weatherforecast/View/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendtoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
          width: 100,
          height: 100,
          child: Icon(Icons.sunny_snowing))),
    );
  }
  Future<void> sendtoHome()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
  }
}
