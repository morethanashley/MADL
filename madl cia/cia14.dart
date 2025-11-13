import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern TabBar UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const ModernTabBarScreen(),
    );
  }
}

/// The main screen containing the TabBar and TabBarView
class ModernTabBarScreen extends StatelessWidget {
  const ModernTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: const Text(
            'Modern Messenger',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          centerTitle: true,
          // Add gradient background to AppBar
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Define the tabs in the AppBar
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
            tabs: [
              Tab(
                icon: Icon(Icons.chat_bubble_outline),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(Icons.circle_outlined),
                text: 'Status',
              ),
            ],
          ),
        ),

        // TabBarView displays the content of each tab
        body: const TabBarView(
          children: [
            ChatsTab(),
            StatusTab(),
          ],
        ),
      ),
    );
  }
}

/// Chats tab with a list of chat previews
class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Example chat data
    final chats = List.generate(
      10,
      (index) => {
        "name": "User ${index + 1}",
        "message": "Hey there! This is chat ${index + 1}",
        "time": "${index + 1}:30 PM",
      },
    );

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.deepPurpleAccent.shade100,
              child: Text(
                chat["name"]![0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            title: Text(
              chat["name"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              chat["message"]!,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chat["time"]!,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                const Icon(
                  Icons.message_outlined,
                  color: Colors.deepPurple,
                  size: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Status tab with user statuses
class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = List.generate(
      8,
      (index) => {
        "name": "Friend ${index + 1}",
        "status": "Shared a new update",
        "time": "${index + 8}:00 AM",
      },
    );

    return Container(
      color: Colors.grey.shade100,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: statuses.length,
        itemBuilder: (context, index) {
          final status = statuses[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.pinkAccent.shade100,
                    child: Icon(
                      Icons.person,
                      color: Colors.white.withOpacity(0.9),
                      size: 28,
                    ),
                  ),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ],
              ),
              title: Text(
                status["name"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                "${status["status"]!} • ${status["time"]!}",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          );
        },
      ),
    );
  }
}
