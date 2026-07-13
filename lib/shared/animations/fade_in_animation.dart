import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final double delay;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.delay = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 500.ms, delay: (delay * 1000).ms),
        MoveEffect(
          begin: const Offset(0, 20),
          end: Offset.zero,
          duration: 500.ms,
          delay: (delay * 1000).ms,
        ),
      ],
      child: child,
    );
  }
}