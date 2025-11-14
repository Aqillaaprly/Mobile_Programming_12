import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

// STREAM UNTUK NUMBER
class NumberStream {
  final controller = StreamController<int>();

  void addNumber(int number) {
    controller.sink.add(number);
  }

  void addError() {
    controller.sink.addError("Terjadi Error");
  }
}

// STREAM UNTUK COLOR
class ColorStream {
  Stream<Color> getColors() async* {
    final random = Random();
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    }
  }
}