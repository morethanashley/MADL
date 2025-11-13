import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row of Action Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF4F4F8),
      ),
      home: const ActionButtonsPage(),
    );
  }
}

class ActionButtonsPage extends StatelessWidget {
  const ActionButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Actions'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Call Button
            _buildActionButton(
              icon: Icons.call,
              label: 'Call',
              color: Colors.green,
              onPressed: () {
                print('Call Button Pressed');
              },
            ),

            // Message Button
            _buildActionButton(
              icon: Icons.message,
              label: 'Message',
              color: Colors.blue,
              onPressed: () {
                print('Message Button Pressed');
              },
            ),

            // Email Button
            _buildActionButton(
              icon: Icons.email,
              label: 'Email',
              color: Colors.deepPurple,
              onPressed: () {
                print('Email Button Pressed');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Custom reusable button widget
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Ink(
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: color),
            iconSize: 32,
            onPressed: onPressed,
            tooltip: label,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
