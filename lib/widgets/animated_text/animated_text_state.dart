import 'dart:async';
import 'package:flutter/widgets.dart';

import 'animated_text.dart';
import 'events.dart';

class AnimatedTextState extends State<AnimatedText> {
  AnimatedTextEvent _state;
  final Text text;
  final Duration duration;
  StreamSubscription _subscription;

  AnimatedTextState(this._state, this.text, this.duration,
      StreamController<AnimatedTextEvent> hideEventStream) {
    _subscription = hideEventStream.stream.listen((event) {
      setState(() {
        _state = event;
        if (event is CancelAnimatedText) _subscription.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
      tween: _state.getTween(begin: 0, end: 1),
      duration: duration,
      curve: Curves.easeInOutCubic,
      builder: (BuildContext _, double value, Widget __) {
        return Text(
          text.data,
          style: text.style.copyWith(
            color:
                text.style.color.withOpacity(value * text.style.color.opacity),
          ),
        );
      });

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
