import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Bottom Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF4F4F8),
      ),
      home: const ModernBottomNav(),
    );
  }
}

class ModernBottomNav extends StatefulWidget {
  const ModernBottomNav({super.key});

  @override
  State<ModernBottomNav> createState() => _ModernBottomNavState();
}

class _ModernBottomNavState extends State<ModernBottomNav> {
  int _currentIndex = 0;

  // List of pages (can later be real screens)
  final List<Widget> _pages = [
    const PageContent(
      title: 'Home',
      icon: Icons.home,
      color1: Colors.deepPurple,
      color2: Colors.pinkAccent,
    ),
    const PageContent(
      title: 'Search',
      icon: Icons.search,
      color1: Colors.blue,
      color2: Colors.cyanAccent,
    ),
    const PageContent(
      title: 'Profile',
      icon: Icons.person,
      color1: Colors.orange,
      color2: Colors.deepOrangeAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main body changes based on _currentIndex
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _pages[_currentIndex],
      ),

      // Modern bottom navigation bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Page UI Widget
class PageContent extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color1;
  final Color color2;

  const PageContent({
    super.key,
    required this.title,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "This is the $title page.",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
