import 'package:coffee_app/business_logic/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:coffee_app/business_logic/cubits/coffee_image/coffee_image_cubit.dart';
import 'package:coffee_app/localization.dart';
import 'package:coffee_app/presentation/widgets/bottom_navigation/bottom_navigation_bar_widget.dart';
import 'package:coffee_app/presentation/screens/new_coffee_photos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CoffeeImageCubit>().getCoffeePhoto();

    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Localization.current.home_screen_title),
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<BottomNavigationCubit>().changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: state.currentIndex,
            children: const [
              NewCoffeePhotosScreen(),
              Center(child: Text('Home Page')),
            ],
          ),
        );
      },
    );
  }
}