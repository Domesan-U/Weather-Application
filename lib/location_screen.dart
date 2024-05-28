import 'package:flutter/material.dart';
import 'package:weather/city_screen.dart';
import 'constants.dart';
import 'weather_condition.dart';

WeatherCondition weatherEmojis = WeatherCondition();

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData);
  final weatherData;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temparature;
  int? id;
  String? weatherDesc;
  String? cityName;
  @override
  void initState() {
    super.initState();
    var decodeData = widget.weatherData;

    updateGetUi(decodeData);
  }

  updateGetUi(dynamic decodeData) {
    setState(
          () {
        if (decodeData != null) {
          print('decodeData: $decodeData');
          double temp = decodeData['main']['temp'];
          temparature = temp.toInt();
          id = decodeData['weather'][0]['id'];
          weatherDesc = decodeData['weather'][0]['description'];
          cityName = decodeData['name'];
        } else {
          temparature = 0;
          id = 0;
          weatherDesc = 'Sorry:( Unable to proceed';
          cityName = '';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherEmojis.getWeatherData();
                      updateGetUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        String typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ),
                        );
                        if (typedName != null) {
                          var cityData =
                          await weatherEmojis.getCityData(typedName);
                          updateGetUi(cityData);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${temparature}°', style: kTempTextStyle),

                    SafeArea(
                      child: Text(
                        '${weatherEmojis.getWeatherIcon(id ?? 0)}',
                        style: TextStyle(fontSize: 55.0,textBaseline: TextBaseline.alphabetic),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherEmojis.getMessage(temparature ?? 0)} in ${cityName ?? ''}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
