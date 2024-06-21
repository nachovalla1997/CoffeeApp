import 'package:coffee_app/business_logic/providers/bottom_navigation_provider.dart';
import 'package:coffee_app/l10n/generated/l10n.dart';
import 'package:coffee_app/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainMenu extends ConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.home_screen_title),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: currentIndex,
          onTap: (index) =>
              ref.read(currentIndexProvider.notifier).state = index),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Center(child: Text('Home Page')),
          Center(child: Text('Favorite Page')),
        ],
      ),
    );
  }
}
