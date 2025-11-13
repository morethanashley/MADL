import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Color Toggler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const ColorTogglerScreen(),
    );
  }
}

class ColorTogglerScreen extends StatefulWidget {
  const ColorTogglerScreen({super.key});

  @override
  State<ColorTogglerScreen> createState() => _ColorTogglerScreenState();
}

class _ColorTogglerScreenState extends State<ColorTogglerScreen> {
  Color _backgroundColor = Colors.white;
  bool _isBlue = false;

  void _toggleColor() {
    setState(() {
      _isBlue = !_isBlue;
      _backgroundColor = _isBlue ? Colors.blueAccent : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modern Color Toggler',
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

      // Animated background color transition
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isBlue ? Icons.light_mode : Icons.nightlight_round,
                size: 100,
                color: _isBlue ? Colors.white : Colors.deepPurple,
              ),
              const SizedBox(height: 20),
              Text(
                _isBlue ? 'Blue Mode 🌊' : 'White Mode ☁️',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: _isBlue ? Colors.white : Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),

      // Stylish floating action button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleColor,
        backgroundColor: _isBlue ? Colors.deepPurple : Colors.pinkAccent,
        icon: const Icon(Icons.color_lens_rounded, color: Colors.white),
        label: Text(
          _isBlue ? 'Switch to White' : 'Switch to Blue',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
