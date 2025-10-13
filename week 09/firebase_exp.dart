import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ✅ Paste your Firebase web config values here (Dart syntax, not JS)
const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyBeeXKCVek25Mbjo0BNlFlTJpLVILK7Lpw",
  authDomain: "my-flutter-app-aed79.firebaseapp.com",
  projectId: "my-flutter-app-aed79",
  storageBucket: "my-flutter-app-aed79.firebasestorage.app",
  messagingSenderId: "345609173603",
  appId: "1:345609173603:web:a2c83ab6c7e49a812dd656",
  measurementId: "G-CTG6GEWJ63",
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zapp.run Firebase Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final users = FirebaseFirestore.instance.collection('users');

  Future<void> _addUser(String name) async {
    if (name.isEmpty) return;
    await users.add({'name': name, 'timestamp': FieldValue.serverTimestamp()});
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Users')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Enter user name'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _addUser(_controller.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: users.orderBy('timestamp', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data!.docs;
                return ListView(
                  children: docs.map((doc) {
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(doc['name']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
