import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: PaginaSorteio()));
}

class PaginaSorteio extends StatefulWidget {
  @override
  _PaginaSorteioState createState() => _PaginaSorteioState();
}

class _PaginaSorteioState extends State<PaginaSorteio> {
  int _numero = 0;

  void sortear() {
    setState(() {
      _numero = Random().nextInt(10) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu App Interativo")),
      body: Center(
        child: Text(
          "Numero Sorteado: $_numero",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: sortear,
      child: Icon(Icons.refresh)),
    );
  }
}