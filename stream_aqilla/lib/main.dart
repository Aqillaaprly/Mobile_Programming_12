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
  late StreamSubscription subscription;

  late StreamSubscription subscription2;
  String values = '';

  @override
  void initState() {
    super.initState();

    colorStream = ColorStream();
    changeColor();

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    Stream stream = numberStreamController.stream.asBroadcastStream();

    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
  }

  void stopStream() {
    subscription.cancel();
    subscription2.cancel();
    numberStreamController.close();
  }

  void addRandomNumber() {
    Random random = Random();
    int randomNum = random.nextInt(10);

    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(randomNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void changeColor() {
    colorStream.getColors().listen((event) {
      setState(() {
        bgColor = event;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    subscription2.cancel();
    numberStreamController.close();
    super.dispose();
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
              values,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: stopStream,
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}