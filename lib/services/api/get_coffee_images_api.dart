import 'dart:convert';

import 'package:http/http.dart' as http;

class GetCoffeeImagesAPI {
  static const String _api = 'https://coffee.alexflipnote.dev';

  static Future<dynamic> getCoffeePhoto() async {
    final response = await http.get(Uri.parse(_api));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load coffee photo');
    }
  }
}
