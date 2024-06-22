import 'dart:io';

import 'package:coffee_app/models/coffee_photo.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

class CoffeeImageWidget extends StatelessWidget {
  final CoffeePhoto coffeePhoto;

  const CoffeeImageWidget({super.key, required this.coffeePhoto});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<File>(
        future: _loadImageFile(coffeePhoto.photo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading image'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Image not found'));
          } else {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
                image: DecorationImage(
                  image: FileImage(snapshot.data!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Gola",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<File> _loadImageFile(File file) async {
    // Check if the file exists
    if (!await file.exists()) {
      throw Exception('File does not exist');
    }

    // Check if the file is not empty
    if (await file.length() == 0) {
      throw Exception('File is empty');
    }

    // Check if the file is a valid image
    try {
      final bytes = await file.readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) {
        throw Exception('Invalid image file');
      }
    } catch (e) {
      throw Exception('Error decoding image file: $e');
    }

    // Simulate a delay for loading the image file
    await Future.delayed(const Duration(milliseconds: 500));
    return file;
  }
}
