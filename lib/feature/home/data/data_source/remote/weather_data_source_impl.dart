import 'dart:convert';
import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/feature/home/data/model/weather_model.dart';
import 'package:http/http.dart' as http;

import 'package:ai_weather/core/api/api_manager.dart';
import 'package:ai_weather/core/api/end_points.dart';
import 'package:ai_weather/feature/home/data/data_source/remote/weather_data_source.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  @override
  Future<WeatherModel> getAllData({required String location}) async {
    http.Response response = await ApiManager.getData(
        endPoint: EndPoints.weatherEndPoint,
        parameter: {
          'q': location,
          'days': '3',
          'hour': '24',
          'key': '1801de79cc0046d88f8100810251602',
        });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse == null || jsonResponse.isEmpty) {
        throw Exception(AppStrings.emptyResponse);
      }

      WeatherModel weatherModel = WeatherModel.fromJson(jsonResponse);

      print(weatherModel.location?.country ?? 'null');
      return weatherModel;
    } else {
      throw ServerException(message: AppStrings.failedToFetch);
    }
  }
}
