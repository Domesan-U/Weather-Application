import 'location.dart';
import 'network.dart';

class WeatherCondition{

  Future<dynamic> getCityData(String cityName)async {
      Network myNetworkObj = Network('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=72f689b39169d8638078ef49bad26992&units=metric');
      var cityData = await myNetworkObj.getNetwork();
      return cityData;
  }

  Future<dynamic> getWeatherData() async{
    Location myLocationObj = Location();
    var LocationData = await myLocationObj.GetCurrentLocation();
    Network myNetworkObj = Network('https://api.openweathermap.org/data/2.5/weather?lat=${myLocationObj.latitude}&lon=${myLocationObj.longitude}&appid=72f689b39169d8638078ef49bad26992&units=metric');
    var weatherData = await myNetworkObj.getNetwork();
    return weatherData;
  }

  String getWeatherIcon(int condition){
    if(condition==0) {
      return '';
    }
    else if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧   ';
    } else if (condition < 600) {
      return '☔  ️';
    } else if (condition < 700) {
      return '🌨️';
    } else if (condition < 800) {
      return '🌦   ';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }
  String getMessage(int temp){
       if(temp==0){
            return "Error: Enter proper location";
        }
      else if (temp > 25) {
        return 'It\'s 🍦 time';
      } else if (temp > 20) {
        return 'Time for shorts and 👕';
      } else if (temp < 10) {
        return 'You\'ll need 🧣 and 🧤';
      } else {
        return 'Bring a 🧥 just in case';
      }
  }
  }