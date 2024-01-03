// SecondPage.dart
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the home page
            Navigator.pop(context);
          },
          child: const Text('Go back to Home Page'),
        ),
      ),
    );
  }
}
