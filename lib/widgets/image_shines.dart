import 'dart:ui';
import 'package:flutter/material.dart';

class ImageShines extends StatelessWidget {
  final Image diamondImage;
  final Color color;
  final double blur;

  ImageShines(
    String assetName, {
    double width = 128,
    this.color = Colors.transparent,
    this.blur = 0,
  }) : diamondImage = Image(
          width: width,
          filterQuality: FilterQuality.medium,
          image: AssetImage(assetName),
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        diamondImage,
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(color: color),
        ),
      ],
    );
  }
}
