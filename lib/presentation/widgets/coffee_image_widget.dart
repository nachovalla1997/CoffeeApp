import 'package:coffee_app/models/coffee_image.dart';
import 'package:flutter/material.dart';

class CoffeeImageWidget extends StatelessWidget {
  final CoffeeImage coffeeImage;

  const CoffeeImageWidget({super.key, required this.coffeeImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
        image: DecorationImage(
          image: FileImage(coffeeImage.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
