import 'package:coffee_app/models/coffee_photo.dart';
import 'package:flutter/material.dart';

class CoffeeImageWidget extends StatelessWidget {
  final CoffeePhoto coffeePhoto;

  const CoffeeImageWidget({super.key, required this.coffeePhoto});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
          image: DecorationImage(
            image: FileImage(coffeePhoto.photo),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
