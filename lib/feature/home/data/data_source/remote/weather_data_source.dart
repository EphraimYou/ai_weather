import 'package:ai_weather/feature/home/data/model/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getAllData({required String location});
}
