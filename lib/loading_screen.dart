import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location.dart';
import 'location_screen.dart';
import 'weather_condition.dart';
Location location = Location();
WeatherCondition myWeatherObj = WeatherCondition();
double? latitude;
double? longitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var weatherData = await myWeatherObj.getWeatherData();
      Navigator.push(
         context,
        MaterialPageRoute(
      builder: (context) {
          return LocationScreen(weatherData);}
    ));
  }
        //),
      //);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.grey,
          size: 50.0,
        ),
      ),
    );
  }
}
