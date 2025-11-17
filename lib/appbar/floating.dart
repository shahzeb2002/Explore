import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingAppBarDemo extends StatelessWidget {
  const FloatingAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Text(
                "Floating AppBar",
                style: GoogleFonts.urbanist(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500.withOpacity(0.9),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white),
                  Text(
                    "Floating App Bar",
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
