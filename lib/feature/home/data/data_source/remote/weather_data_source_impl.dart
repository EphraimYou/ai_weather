import 'dart:convert';
import 'package:ai_weather/core/error/exception.dart';
import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:ai_weather/core/utils/constants.dart';
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
          'days': '14',
          'hour': '24',
          'key': AppConstants.apiKey,
        });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse == null || jsonResponse.isEmpty) {
        throw Exception(AppStrings.emptyResponse);
      }

      WeatherModel weatherModel = WeatherModel.fromJson(jsonResponse);

      return weatherModel;
    } else {
      throw ServerException(message: AppStrings.failedToFetch);
    }
  }

  @override
  Future<int> getPrediction({required List<int> features}) async {
    Map<String, dynamic> body = {'features': features};
    try {
      final response = await ApiManager.postData(
        baseUrl: AppConstants.localHost,
        endPoint: EndPoints.aiModelEndPoint,
        parameter: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final predictionList = responseData['prediction'];
        final prediction = predictionList[0] as int;
        print('✅ API Response: $prediction');
        return prediction;
      } else {
        throw ServerException(
            message: '${AppStrings.failedToFetch} ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException(message: AppStrings.failedToFetch);
    }
  }
}
