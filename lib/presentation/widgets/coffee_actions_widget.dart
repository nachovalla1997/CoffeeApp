import 'package:coffee_app/localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoffeeActionsWidget extends StatelessWidget {
  final Function onAddToFavorites;
  final Function onSkip;

  const CoffeeActionsWidget(
      {super.key, required this.onAddToFavorites, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () => onAddToFavorites(),
            icon: const FaIcon(FontAwesomeIcons.solidHeart),
            label: Text(Localization.current.add_to_favorite),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => onSkip(),
            icon: const FaIcon(FontAwesomeIcons.arrowRight),
            label: Text(Localization.current.next),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.brown[900],
              backgroundColor: Colors.brown[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
