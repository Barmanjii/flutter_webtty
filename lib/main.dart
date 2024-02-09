import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

TextEditingController machineIdValue = TextEditingController(text: "SD0451001");
TextEditingController userIdValue = TextEditingController(text: "barman");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Webtty Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Webtty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _handleSubmit() {
    String machineId = machineIdValue.text;
    String userId = userIdValue.text;

    js.context
        .callMethod('mainRun', ["http://localhost:2323/", machineId, userId]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: machineIdValue,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Machine ID",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: userIdValue,
                      decoration: const InputDecoration(
                        labelText: "Enter User ID",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: _handleSubmit,
                      child: const Text('Submit'),
                    )
                  ],
                ),
              ), // Spacing between text field and button
            ],
          ),
        ),
      ),
    );
  }
}
