import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class GetCoffeeImagesAPI {
  static const String _api = 'https://coffee.alexflipnote.dev/random';

  Future<File> getCoffeePhoto() async {
    final response = await http.get(Uri.parse(_api));

    // Check if the HTTP request was successful
    if (response.statusCode != 200) {
      throw Exception('Failed to load image');
    }

    // Check if the response body is not empty
    if (response.bodyBytes.isEmpty) {
      throw Exception('Image data is empty');
    }

    // Check if the response body contains valid image data
    final image = img.decodeImage(response.bodyBytes);
    if (image == null) {
      throw Exception('Invalid image data');
    }

    // Get the application documents directory
    final documentDirectory = await getApplicationDocumentsDirectory();

    // Create a file to save the image
    final file = File('${documentDirectory.path}/coffee_image2.jpg');

    // Write the image data to the file
    await file.writeAsBytes(response.bodyBytes);

    return file;
  }
}
