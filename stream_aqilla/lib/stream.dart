import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int number) {
    controller.sink.add(number);
  }
}

class ColorStream {
  Stream<Color> getColors() async* {
    final random = Random();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
    }
  }
}