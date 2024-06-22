import 'package:coffee_app/services/get_coffee_image_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProviders {
  static MultiProvider multiServiceProvider(
      {required Widget child, required BuildContext context}) {
    return MultiProvider(
      providers: [
        Provider<GetCoffeeImageService>(
          create: (context) => GetCoffeeImageService(),
        )
      ],
      child: child,
    );
  }
}
