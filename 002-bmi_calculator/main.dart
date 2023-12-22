import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 46, 146, 27)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 47, 153, 51)),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator>
    with SingleTickerProviderStateMixin {
  double weight = 0.0;
  double height = 0.0;
  double bmi = 0.0;
  late AnimationController _controller; // Added 'late' keyword

  late Animation<Offset> _offsetAnimation;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Color.fromARGB(255, 16, 140, 20),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height / 2,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Your BMI'),
                      content: Text('Your BMI is: ${bmi.toStringAsFixed(2)}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            weightController.clear();
                            heightController.clear();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.network(
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fgood-health-good-life-female-hand-chalk-writing-text-blue-background-97044786.jpg&tbnid=lNFrwCZAJvL-oM&vet=1&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fgood-health.html&docid=-ZHgXh1waYdsOM&w=800&h=526&source=sh%2Fx%2Fim%2Fm1%2F1',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        weight = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle: TextStyle(color: const Color.fromARGB(255, 16, 18, 16)),
                      errorText: showError ? 'Please enter your weight' : null,
                    ),
                    style: TextStyle(color: const Color.fromARGB(255, 16, 18, 16)),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        height = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle: TextStyle(color:const Color.fromARGB(255, 16, 18, 16)),
                      errorText: showError ? 'Please enter your Height' : null,
                    ),
                    style: TextStyle(color:const Color.fromARGB(255, 16, 18, 16)),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (weight == 0.0 || height == 0.0) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        setState(() {
                          showError = false;
                          calculateBMI();
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      primary: Colors.green,
                    ),
                    child: Text(
                      'Calculate BMI',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'BMI RESULTS',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'BMI is: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18, // Increase font size
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  weightController.clear();
                  heightController.clear();
                },
                child: Text('OK'),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
