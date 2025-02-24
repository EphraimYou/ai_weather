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
    final url = Uri.parse("http://192.168.1.2:5001/predict");

    final body = jsonEncode({'features': features});

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final predictionList = responseData['prediction']; // This is a List
        final prediction = predictionList[0] as int;
        print('✅ API Response: $prediction'); // Debugging
        return prediction;
      } else {
        print('❌ API returned status: ${response.statusCode}');
        throw ServerException(
            message: 'Failed to fetch prediction: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ API Connection Error: $e');
      throw ServerException(message: 'Failed to fetch prediction');
    }
  }

  // @override
  // Future<int> getPrediction({required List<int> features}) async {
  //   Map<String, dynamic> parameters = {
  //     'features': features,
  //   };

  //   try {
  //     final response = await ApiManager.postData(
  //       baseUrl: 'http://10.0.2.2:5001',
  //       endPoint: '/predict',
  //       parameter: parameters,
  //     );

  //     print("Response Status Code: ${response.statusCode}");
  //     print("Response Body: ${response.body}");

  //     if (response.statusCode != 200) {
  //       throw ServerException(
  //           message: "Failed to fetch data. Status: ${response.statusCode}");
  //     }

  //     final decodedResponse = json.decode(response.body);
  //     if (!decodedResponse.containsKey('prediction')) {
  //       throw ServerException(
  //           message: "Invalid response structure: ${response.body}");
  //     }

  //     return decodedResponse['prediction'];
  //   } catch (e) {
  //     print("Error in API Request: $e");
  //     throw ServerException(message: "Failed to fetch data");
  //   }
  // }
}
