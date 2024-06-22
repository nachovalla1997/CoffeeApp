import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class GetCoffeeImagesAPI {
  static const String _api = 'https://coffee.alexflipnote.dev';

  Future<File> getCoffeePhoto() async {
    final response = await http.get(Uri.parse(_api));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File('${documentDirectory.path}/coffee_image.jpg');
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
