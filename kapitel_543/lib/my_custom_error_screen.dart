import 'package:flutter/material.dart';

class MyCustomErrorScreen extends StatelessWidget {
  String? t = null;

  MyCustomErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(t!),
        backgroundColor: const Color.fromARGB(255, 241, 179, 175),
      ),
      
    );
  }
}
