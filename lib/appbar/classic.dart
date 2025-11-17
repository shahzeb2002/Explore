import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassicAppBarDemo extends StatelessWidget {
  const ClassicAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Classic AppBar",
          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications, color: Colors.grey.shade100),
          ),
        ],
      ),

      body: Center(
        child: Text(
          "Classic AppBar ",
          style: GoogleFonts.urbanist(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}
