import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvedAppBarDemo extends StatelessWidget {
  const CurvedAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.grey.shade700,
          centerTitle: true,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),

          title: Text(
            "Curved AppBar",
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
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.notifications, color: Colors.grey.shade100),
            ),
          ],
        ),
      ),


      body: Center(
        child: Text(
          "Curved AppBar ",
          style: GoogleFonts.urbanist(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),
        ),
      ),
    );
  }
}
