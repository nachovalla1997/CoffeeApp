import 'dart:typed_data';

import 'package:http/http.dart' as http;

class GetCoffeeImageAdapter {
  static Uint8List convertToCoffeePhoto(http.Response response) {
    return response.bodyBytes;
  }
}
