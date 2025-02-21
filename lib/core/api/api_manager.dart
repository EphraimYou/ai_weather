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
}
