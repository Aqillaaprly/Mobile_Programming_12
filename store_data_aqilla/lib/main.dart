import 'dart:convert';
import 'dart:io';
import 'package:store_data_aqilla/model/pizza.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON_Aqilla Aprily',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';

  // FILE HANDLING
  File? myFile;
  String fileText = '';

  // SECURE STORAGE
  final storage = const FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ),
  iOptions: IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  ),
);
  final myKey = 'myPass';
  final TextEditingController pwdController = TextEditingController();
  String myPass = '';

  List<Pizza> myPizzas = [];

  @override
  void initState() {
    super.initState();

    // 1. PATHS + FILE INIT
    getPaths().then((_) async {
      myFile = File('$documentsPath/pizzas.txt');

      if (!(await myFile!.exists())) {
        await writeFile();
      }
    });

    // 2. SHARED PREF FIXED
    loadCounter();

    // 3. READ JSON FILE
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  // ---------------- PATH PROVIDER -----------------
  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      appCounter = prefs.getInt('appCounter') ?? 0;
      appCounter++;
    });

    await prefs.setInt('appCounter', appCounter);
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("appCounter"); 

    setState(() {
      appCounter = 0;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile!.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String content = await myFile!.readAsString();
      setState(() {
        fileText = content;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
    setState(() {
      myPass = pwdController.text;
    });
    pwdController.clear();
  }

  Future readFromSecureStorage() async {
    String? secret = await storage.read(key: myKey) ?? '';
    setState(() {
      myPass = secret;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON_Aqilla Aprily')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              'App opened $appCounter times',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: deletePreference,
                child: const Text("Reset Counter"),
              ),
            ),

            const SizedBox(height: 20),

            Text("Doc path: $documentsPath"),
            Text("Temp path: $tempPath"),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: readFile,
              child: const Text("Read File"),
            ),

            Text(fileText),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Secure Text",
                ),
              ),
            ),

            ElevatedButton(
              child: const Text('Save Value'),
              onPressed: writeToSecureStorage,
            ),

            ElevatedButton(
              child: const Text('Read Value'),
              onPressed: readFromSecureStorage,
            ),

            Text("Stored Secure Value: $myPass"),

            const SizedBox(height: 20),

            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: myPizzas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(myPizzas[index].pizzaName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(myPizzas[index].description),
                        Text("Price: \$${myPizzas[index].price}"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- JSON FILE -----------------
  Future<List<Pizza>> readJsonFile() async {
    String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');

    List<dynamic> pizzaMapList = jsonDecode(myString);
    return pizzaMapList.map((json) => Pizza.fromJson(json)).toList();
  }
}