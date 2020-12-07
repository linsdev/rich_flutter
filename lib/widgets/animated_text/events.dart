import 'package:flutter/widgets.dart';

abstract class AnimatedTextEvent {
  Tween<double> getTween({double begin, double end});
}

class ShowAnimatedText implements AnimatedTextEvent {
  @override
  Tween<double> getTween({double begin, double end}) =>
      Tween(begin: begin, end: end);
}

class HideAnimatedText implements AnimatedTextEvent {
  @override
  Tween<double> getTween({double begin, double end}) =>
      Tween(begin: end, end: begin);
}

class CancelAnimatedText extends HideAnimatedText {
  @override
  Tween<double> getTween({double begin, double end}) =>
      super.getTween(begin: begin, end: end);
}
