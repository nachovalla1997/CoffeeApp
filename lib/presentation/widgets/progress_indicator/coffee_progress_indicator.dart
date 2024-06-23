import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoffeeProgressIndicator extends StatefulWidget {
  const CoffeeProgressIndicator({super.key});

  @override
  CoffeeProgressIndicatorState createState() => CoffeeProgressIndicatorState();
}

class CoffeeProgressIndicatorState extends State<CoffeeProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat();

    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 0.25)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.25, end: 0.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: -0.25)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -0.25, end: 0.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 3.14159 / 4,
            child: FaIcon(
              FontAwesomeIcons.mugHot,
              size: 80.0,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
