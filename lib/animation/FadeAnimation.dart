import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimProps>()
      ..add(AnimProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(AnimProps.translateY, Tween(begin: -30.0, end: 0.0));

    return PlayAnimation<MultiTweenValues<AnimProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AnimProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AnimProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}
