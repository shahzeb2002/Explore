import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvedBottomNavDemo extends StatefulWidget {
  const CurvedBottomNavDemo({super.key});

  @override
  State<CurvedBottomNavDemo> createState() => _CurvedBottomNavDemoState();
}

class _CurvedBottomNavDemoState extends State<CurvedBottomNavDemo> {
  int _page = 1;

  final List<Widget> screens = const [
    Center(child: Text("Search Screen")),
    Center(child: Text("Home Screen")),
    Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: Text(
          "Curved Bottom Nav",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: screens[_page],

      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 55,
        color: Colors.grey[800]!,
        buttonBackgroundColor: Colors.black12,
        backgroundColor: Colors.grey[200]!,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.search, size: 28, color: Colors.white),
          Icon(Icons.home, size: 28, color: Colors.white),
          Icon(Icons.person, size: 28, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
