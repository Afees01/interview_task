import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreenController {
  static String baseURL = "https://dashboard.cptguide.org/api/blogs";
  

  static Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(baseURL));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
