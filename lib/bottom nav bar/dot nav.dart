import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DotBottomNavDemo extends StatefulWidget {
  const DotBottomNavDemo({super.key});

  @override
  State<DotBottomNavDemo> createState() => _DotBottomNavDemoState();
}

class _DotBottomNavDemoState extends State<DotBottomNavDemo> {
  int _currentIndex = 0;

  final List<Widget> screens = const [
    Center(child: Text("Home Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Notifications Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Dot Navigation Bar",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black12
          ),
        ),
      ),

      body: screens[_currentIndex],

      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
        dotIndicatorColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.blueAccent,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.notifications),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
