import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Animated Container',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const AnimatedContainerDemo(),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.deepPurple;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void _changeContainer() {
    final random = Random();
    setState(() {
      // Random width and height between 100–250
      _width = random.nextDouble() * 150 + 100;
      _height = random.nextDouble() * 150 + 100;

      // Random color
      _color = Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );

      // Random border radius
      _borderRadius = BorderRadius.circular(random.nextInt(60).toDouble() + 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modern Animated Container',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutBack,
        color: Colors.grey.shade100,
        child: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _changeContainer,
        backgroundColor: Colors.deepPurple,
        icon: const Icon(Icons.auto_awesome, color: Colors.white),
        label: const Text(
          'Animate!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
