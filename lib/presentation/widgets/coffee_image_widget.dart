import 'dart:io';

import 'package:coffee_app/models/coffee_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoffeeImageWidget extends StatelessWidget {
  final CoffeeImage coffeeImage;

  const CoffeeImageWidget({super.key, required this.coffeeImage});

  Future<File> _loadImage() async {
    return File(coffeeImage.image.path);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: _loadImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
              ),
            ),
          );
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
    );
  }
}
