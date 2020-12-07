import 'package:flutter/material.dart';

class BumpedText extends StatelessWidget {
  final String text;
  final double light;
  final TextStyle style;

  BumpedText(this.text, {this.light, TextStyle style})
      : this.style = style.copyWith(shadows: [
          Shadow(
            color: Colors.black.withOpacity(light),
            blurRadius: 2 - 0.5 * light,
            offset: Offset(0, -1),
          ),
          Shadow(
            color: Colors.white.withOpacity(0.25 * light),
            blurRadius: 0.8 - 0.25 * light,
            offset: Offset(0, 1),
          ),
        ]);

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center, style: style);
  }
}
