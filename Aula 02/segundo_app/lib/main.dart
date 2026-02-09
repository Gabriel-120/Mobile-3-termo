import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello Word APP"),backgroundColor: Colors.green,),
        body: Center(child: Text("Olá, Mundo!")),
      ),
    );
  }
}
