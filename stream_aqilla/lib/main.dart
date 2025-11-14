import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Aqilla Aprily',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  @override
  void initState() {
    super.initState();

    colorStream = ColorStream();
    changeColor();

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    final transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);  
      },
      handleError: (error, trace, sink) {
        sink.add(-1);         
      },
      handleDone: (sink) => sink.close(),
    );

    numberStreamController.stream
        .transform(transformer)
        .listen((event) {
      setState(() {
        lastNumber = event;
      });
    }, onError: (error) {
      setState(() {
        lastNumber = -1;
      });
    });
  }

  void addRandomNumber() {
    final random = Random();
    int newNumber = random.nextInt(10);
    numberStream.addNumber(newNumber);
  }

  void changeColor() {
    colorStream.getColors().listen((event) {
      setState(() {
        bgColor = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Aqilla Aprily'),
      ),
      body: Container(
        width: double.infinity,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }
}
