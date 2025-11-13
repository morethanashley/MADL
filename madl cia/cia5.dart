import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade In Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF4F4F8),
      ),
      home: const FadeInPage(),
    );
  }
}

class FadeInPage extends StatefulWidget {
  const FadeInPage({super.key});

  @override
  State<FadeInPage> createState() => _FadeInPageState();
}

class _FadeInPageState extends State<FadeInPage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // Delay the animation by 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(top: _visible ? 0 : 40),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.waving_hand_rounded,
                      size: 80,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "We’re glad to see you here.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
