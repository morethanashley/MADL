import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Data Display',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF4F4F8),
      ),
      home: const FruitListPage(),
    );
  }
}

class FruitListPage extends StatelessWidget {
  const FruitListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 1: Local JSON String
    const String jsonString = '''
      [
        {"name": "Apple", "color": "#FF4E50"},
        {"name": "Banana", "color": "#F9D423"},
        {"name": "Cherry", "color": "#FF6B6B"},
        {"name": "Grapes", "color": "#9D50BB"},
        {"name": "Orange", "color": "#FFA500"},
        {"name": "Watermelon", "color": "#4CAF50"},
        {"name": "Blueberry", "color": "#2196F3"},
        {"name": "Mango", "color": "#FFB300"}
      ]
    ''';

    // Step 2: Decode JSON
    final List<dynamic> fruits = json.decode(jsonString);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fruits List',
          style: TextStyle(fontWeight: FontWeight.w600),
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

      // Step 3: Display the parsed list
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return _buildFruitCard(fruit);
        },
      ),
    );
  }

  // Custom card UI for each fruit
  Widget _buildFruitCard(Map<String, dynamic> fruit) {
    final colorHex = fruit["color"] ?? "#CCCCCC";
    final fruitColor = _hexToColor(colorHex);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: fruitColor.withOpacity(0.2),
          child: Icon(
            Icons.local_florist,
            color: fruitColor,
          ),
        ),
        title: Text(
          fruit['name'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          'A delicious ${fruit['name']} fruit!',
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: () {
          print("You tapped on ${fruit['name']}");
        },
      ),
    );
  }

  // Helper: Convert hex color string to Color object
  Color _hexToColor(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) hex = "FF$hex"; // add alpha
    return Color(int.parse(hex, radix: 16));
  }
}
