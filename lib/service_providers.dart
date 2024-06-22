import 'package:coffee_app/services/get_coffee_images_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProviders {
  static MultiProvider multiServiceProvider(
      {required Widget child, required BuildContext context}) {
    return MultiProvider(
      providers: [
        Provider<GetCoffeeImagesService>(
          create: (context) => GetCoffeeImagesService(),
        )
      ],
      child: child,
    );
  }
}
