import 'package:coffee_app/repositories/path_provider_repository/coffee_image_path_provider_repository.dart';
import 'package:coffee_app/repositories/shared_preferences_repository/favorite_coffee_image_shared_preferences_repository.dart';
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
        RepositoryProvider(
          create: (context) => FavoriteCoffeeImageSharedPreferencesRepository(),
        )
      ],
      child: child,
    );
  }
}
