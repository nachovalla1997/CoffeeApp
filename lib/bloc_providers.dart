import 'package:coffee_app/business_logic/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:coffee_app/business_logic/cubits/get_coffee_image/get_coffee_image_cubit.dart';
import 'package:coffee_app/services/get_coffee_image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static MultiBlocProvider multiBlocProviders({
    required Widget child,
    required BuildContext context,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => GetCoffeeImageCubit(
            getCoffeeImagesService: context.read<GetCoffeeImageService>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
