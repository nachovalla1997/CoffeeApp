import 'package:coffee_app/repositories/coffee_image_path_provider_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryProviders {
  static MultiRepositoryProvider multiRepositoryProvider({
    required Widget child,
    required BuildContext context,
  }) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CoffeeImagePathProviderRepository(),
        ),
      ],
      child: child,
    );
  }
}
