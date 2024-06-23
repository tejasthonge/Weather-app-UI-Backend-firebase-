import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weatherapp/api/feath_weather.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:weatherapp/model/weather_data_current.dart';

class GlobleController extends GetxController {
  final RxBool _isLodding = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  

  RxBool checkLodding() => _isLodding;
  RxDouble getLattitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData(){

    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLodding.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiseEneble;
    LocationPermission locationPermission;
    isServiseEneble = await Geolocator.isLocationServiceEnabled();
    if (!isServiseEneble) {
      return Future.error("Location not Enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission deniad forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
       print("${_longitude.value}");
      print("${_latitude.value}");


      //calling weather api affeter getting current lat and long 


      return FeathchWeatherAppi().prosseseData(lat: value.latitude, lon: value.longitude).then((value) {

        weatherData.value = value;
      _isLodding.value = false;


      } );



     
    });
  }
}
