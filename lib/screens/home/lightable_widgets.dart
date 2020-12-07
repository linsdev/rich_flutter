import 'package:flutter/widgets.dart';

import '../../widgets/bumped_text.dart';

class LightableWidgets extends StatelessWidget {
  final double light;
  final Color backgroundColor;

  LightableWidgets(this.backgroundColor, this.light);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.topCenter,
        child: BumpedText(
          'Rich Flutter',
          light: 0.25 * (1 - light) + light,
          style: TextStyle(
            height: 3.5,
            color: backgroundColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            fontFamily: 'Times',
            fontFamilyFallback: ['Times New Roman'],
          ),
        ),
      );
}
