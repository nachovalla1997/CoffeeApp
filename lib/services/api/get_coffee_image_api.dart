import 'package:http/http.dart' as http;

class GetCoffeeImageAPI {
  static const String _api = 'https://coffee.alexflipnote.dev/random';

  Future<http.Response> getCoffeePhoto() async {
    final response = await http.get(Uri.parse(_api));

    if (response.statusCode != 200) {
      throw Exception('Failed to load image');
    }

    if (response.bodyBytes.isEmpty) {
      throw Exception('Image data is empty');
    }

    return response;
  }
}
