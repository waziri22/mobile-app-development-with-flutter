import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue, // Set the primary color to light blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CIRCLE AREA CALCULATOR'),
          backgroundColor: Colors.lightBlue,
        ),
        body: const CircleAreaCalculator(),
      ),
    );
  }
}

class CircleAreaCalculator extends StatefulWidget {
  const CircleAreaCalculator({super.key});

  @override
  _CircleAreaCalculatorState createState() => _CircleAreaCalculatorState();
}

class _CircleAreaCalculatorState extends State<CircleAreaCalculator> {
  TextEditingController radiusController = TextEditingController();
  double result = 0.0;

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0.0;
    double area = 3.14 * radius * radius; // Assuming pi value is 3.14
    setState(() {
      result = area;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: radiusController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter Radius'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              calculateArea();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue, // Set the button color to light blue
            ),
            child: const Text('Calculate Area'),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Area: $result',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

