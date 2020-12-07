import 'dart:async';
import 'package:flutter/widgets.dart';

import 'package:rich_flutter/repository/dispose.dart';
import 'events.dart';
import 'animated_text_state.dart';

class AnimatedText extends StatefulWidget with Disposable {
  final Text text;
  final Duration duration;
  final StreamController<AnimatedTextEvent> event;

  AnimatedText(this.text, {this.duration = const Duration(seconds: 1)})
      : event = StreamController<AnimatedTextEvent>();

  @override
  State<StatefulWidget> createState() =>
      AnimatedTextState(ShowAnimatedText(), text, duration, event);

  @override
  void dispose() => event.close();
}
