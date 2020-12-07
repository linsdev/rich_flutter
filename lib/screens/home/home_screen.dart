import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:rich_flutter/screens/home/buttons.dart';
import 'package:rich_flutter/widgets/animated_text/animated_text.dart';
import 'package:rich_flutter/widgets/animated_text/events.dart';
import 'package:rich_flutter/widgets/touchable_shine_image/touchable_shine_image.dart';
import 'lightable_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  static const diamondShineColor = const Color(0x00708f);
  final backgroundColor = Colors.blueGrey[900];
  final AnimatedText tapTheScreenText;

  _HomeScreen()
      : tapTheScreenText = AnimatedText(
          Text(
            'Tap the screen',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          duration: Duration(seconds: 4),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          TouchableShineImage(
            'images/diamond.png',
            shineColor: diamondShineColor.withOpacity(0.1),
            animationDuration: Duration(milliseconds: 90),
            childWidget: (double value) =>
                LightableWidgets(backgroundColor, value),
            onTap: () => tapTheScreenText.event.add(HideAnimatedText()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 0.5 * MediaQuery.of(context).size.height,
              child: tapTheScreenText,
            ),
          ),
          ButtonsBar(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tapTheScreenText.dispose();
    super.dispose();
  }
}
