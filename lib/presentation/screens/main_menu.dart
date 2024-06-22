import 'package:coffee_app/business_logic/cubits/cubit/bottom_navigation_cubit.dart';
import 'package:coffee_app/l10n/generated/l10n.dart';
import 'package:coffee_app/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.current.home_screen_title),
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
              Center(child: Text('Home Page')),
              Center(child: Text('Favorite Page')),
            ],
          ),
        );
      },
    );
  }
}
