import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Draggable Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const DraggableDemoPage(),
    );
  }
}

class DraggableDemoPage extends StatefulWidget {
  const DraggableDemoPage({super.key});

  @override
  State<DraggableDemoPage> createState() => _DraggableDemoPageState();
}

class _DraggableDemoPageState extends State<DraggableDemoPage> {
  bool _isDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drag & Drop Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Draggable Widget
            Center(
              child: Draggable<String>(
                data: "dragged",
                feedback: Opacity(
                  opacity: 0.7,
                  child: _buildDraggableBox(
                    "Dragging...",
                    const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.deepPurple],
                    ),
                  ),
                ),
                childWhenDragging: _buildDraggableBox(
                  "Moving...",
                  const LinearGradient(
                    colors: [Colors.grey, Colors.blueGrey],
                  ),
                ),
                child: _buildDraggableBox(
                  "Drag Me 🎯",
                  const LinearGradient(
                    colors: [Colors.deepPurple, Colors.pinkAccent],
                  ),
                ),
              ),
            ),

            // Drop Target Widget
            DragTarget<String>(
              onAccept: (data) {
                setState(() {
                  _isDropped = true;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutBack,
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: _isDropped
                        ? const LinearGradient(
                            colors: [Colors.greenAccent, Colors.teal],
                          )
                        : const LinearGradient(
                            colors: [Colors.grey, Colors.blueGrey],
                          ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _isDropped ? "✅ Dropped Successfully!" : "Drop Here 📦",
                      style: TextStyle(
                        fontSize: 20,
                        color: _isDropped ? Colors.white : Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Custom draggable box widget
  Widget _buildDraggableBox(String label, LinearGradient gradient) {
    return Container(
      height: 120,
      width: 200,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
