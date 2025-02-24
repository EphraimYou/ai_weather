import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiManager {
  static final baseUrl = 'api.weatherapi.com';

  static Future getData(
      {required String endPoint,
      required Map<String, dynamic> parameter}) async {
    Uri url = Uri.https(
      baseUrl,
      endPoint,
      parameter,
    );
    return await http.get(url, headers: {
      'lang': 'en',
      'Content-Type': 'application/json',
    });
  }

  static Future<http.Response> postData({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> parameter,
  }) async {
    Uri url =
        Uri.parse('$baseUrl$endPoint'); // ✅ Use Uri.parse() for better handling

    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(parameter), // ✅ Convert Map to JSON string
    );
  }

  // static Future postData({
  //   required String baseUrl,
  //   required String endPoint,
  //   required Map<String, dynamic> parameter,
  // }) async {
  //   Uri url = Uri.http(
  //     baseUrl,
  //     endPoint,
  //   );
  //   return await http.post(
  //     url,
  //     headers: {
  //       'lang': 'en',
  //       'Content-Type': 'application/json',
  //     },
  //     body: parameter,
  //   );
  // }
}
