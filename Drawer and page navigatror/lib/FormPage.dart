// FormPage.dart
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(
        child: Text('This is the Form Page'),
      ),
    );
  }
}
