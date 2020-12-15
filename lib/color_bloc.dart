import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum ColorEvent { generate_new_random_color }

class ColorBloc {
  Color _color = Colors.blueAccent;

  final _inputEventController = StreamController<ColorEvent>();

  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();

  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.generate_new_random_color)
      _color = Color(Random().nextInt(0xffffffff));
    else
      throw Exception('Wrong Event Type');

    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
