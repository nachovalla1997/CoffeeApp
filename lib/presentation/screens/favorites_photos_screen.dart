import 'package:flutter/material.dart';

class FavoritesPhotosScreen extends StatelessWidget {
  const FavoritesPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Photos'),
      ),
      body: const Center(
        child: Text('Favorites Photos Screen'),
      ),
    );
  }
}
