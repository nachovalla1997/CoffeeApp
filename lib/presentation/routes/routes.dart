import 'package:coffee_app/presentation/routes/routes_names.dart';
import 'package:coffee_app/presentation/screens/favorites_photos_screen.dart';
import 'package:coffee_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutesNames.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RoutesNames.favoritePhotos,
            builder: (BuildContext context, GoRouterState state) {
              return const FavoritesPhotosScreen();
            },
          ),
        ],
      ),
    ],
  );
}
