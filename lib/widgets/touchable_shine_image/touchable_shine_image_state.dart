import 'package:flutter/material.dart';

import '../image_shines.dart';
import 'touchable_shine_image.dart';

class TouchableShineImageState extends State<TouchableShineImage> {
  final String assetName;
  final double width, shine;
  final Color shineColor;
  final Duration animationDuration;
  final WidgetCallbackWithDouble childWidget;
  double shineState;
  final void Function() onTap;

  TouchableShineImageState(this.assetName, this.width, this.shine,
      this.shineColor, this.animationDuration, this.childWidget, this.onTap)
      : shineState = shine;

  onTouch() {
    setState(() {
      shineState = oppositeShineState();
    });
    onTap();
  }

  double oppositeShineState() => shineState > 0 ? 0 : shine;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTouch,
      child: TweenAnimationBuilder(
          duration: animationDuration,
          tween: Tween(begin: shineState, end: oppositeShineState()),
          builder: (BuildContext _, double value, Widget __) {
            final valueInPercentage = value / shine;
            return Stack(
              children: [
                childWidget(valueInPercentage),
                ColorFiltered(
                  child: ImageShines(
                    assetName,
                    width: width,
                    color: shineColor
                        .withOpacity(shineColor.opacity * valueInPercentage),
                    blur: value,
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withAlpha((60 * valueInPercentage).toInt()),
                    BlendMode.plus,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
