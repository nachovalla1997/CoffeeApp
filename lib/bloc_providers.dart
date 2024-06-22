import 'package:coffee_app/business_logic/cubits/bottom_navigation/bottom_navigation_cubit.dart';
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
      ],
      child: child,
    );
  }
}
