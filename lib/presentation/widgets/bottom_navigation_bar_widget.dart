import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house, size: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidHeart, size: 24),
          label: 'Favorites',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 24),
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      elevation: 10,
    );
  }
}
