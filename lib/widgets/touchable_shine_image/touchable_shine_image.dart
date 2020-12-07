import 'package:flutter/material.dart';

import 'touchable_shine_image_state.dart';

typedef WidgetCallbackWithDouble = Widget Function(double value);

class TouchableShineImage extends StatefulWidget {
  final String assetName;
  final double width, shine;
  final Color shineColor;
  final Duration animationDuration;
  final WidgetCallbackWithDouble childWidget;
  final void Function() onTap;

  TouchableShineImage(
    this.assetName, {
    this.width = 128,
    this.shine = 50,
    this.shineColor = Colors.transparent,
    this.animationDuration = const Duration(milliseconds: 60),
    WidgetCallbackWithDouble childWidget,
    this.onTap,
  }) : this.childWidget = childWidget ?? ((double _) => SizedBox.shrink());

  @override
  State<StatefulWidget> createState() => TouchableShineImageState(assetName,
      width, shine, shineColor, animationDuration, childWidget, onTap);
}
