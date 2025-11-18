import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBottomNavDemo extends StatefulWidget {
  const SalomonBottomNavDemo({super.key});

  @override
  State<SalomonBottomNavDemo> createState() => _SalomonBottomNavDemoState();
}

class _SalomonBottomNavDemoState extends State<SalomonBottomNavDemo> {
  int _currentIndex = 0;

  final List<Widget> pages = const [
    Center(child: Text("Home Page")),
    Center(child: Text("Likes Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: Text(
          "Salomon Bottom Bar",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: pages[_currentIndex],

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.blueAccent,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Likes"),
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search"),
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
