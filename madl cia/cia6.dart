import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern ListView Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF4F4F8),
      ),
      home: const ItemListPage(),
    );
  }
}

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Beautiful gradient AppBar
      appBar: AppBar(
        title: const Text(
          'My Modern List',
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

      // Scrollable ListView
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return _buildListItem(index);
        },
      ),
    );
  }

  // Custom modern card for each list item
  Widget _buildListItem(int index) {
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
          radius: 24,
          backgroundColor: Colors.deepPurple.withOpacity(0.15),
          child: Icon(
            Icons.star,
            color: Colors.deepPurple[400],
          ),
        ),
        title: Text(
          "Item ${index + 1}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          "This is the description for item ${index + 1}",
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: () {
          print("Tapped on Item ${index + 1}");
        },
      ),
    );
  }
}
