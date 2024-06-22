import 'dart:io';

import 'package:coffee_app/models/coffee_photo.dart';
import 'package:flutter/material.dart';

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
            );
          }
        },
      ),
    );
  }

  Future<File> _loadImageFile(File file) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return file;
  }
}
