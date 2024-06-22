import 'package:coffee_app/localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewCoffeePhotosWidget extends StatelessWidget {
  const NewCoffeePhotosWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15.0)),
                          // image: DecorationImage(
                          //   image: FileImage(),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Add to favorites logic
                            },
                            icon: const FaIcon(FontAwesomeIcons.solidHeart),
                            label: Text(Localization.current.add_to_favorite),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Skip logic
                            },
                            icon: const FaIcon(FontAwesomeIcons.arrowRight),
                            label: Text(Localization.current.next),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.brown[900],
                              backgroundColor: Colors.brown[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
