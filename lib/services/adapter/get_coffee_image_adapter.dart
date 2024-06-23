import 'dart:typed_data';

import 'package:http/http.dart' as http;

class GetCoffeeImageAdapter {
  static Uint8List convertToCoffeeImage(http.Response response) {
    return response.bodyBytes;
  }
}
