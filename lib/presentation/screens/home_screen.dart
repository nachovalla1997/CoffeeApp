import 'package:coffee_app/presentation/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/${RoutesNames.favoritePhotos}');
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
