import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassAppBarDemo extends StatelessWidget {
  const GlassAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              backgroundColor: Colors.grey.shade600.withOpacity(0.30),
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Glass AppBar",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),

              iconTheme: const IconThemeData(color: Colors.white),

              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade300,
              Colors.grey.shade100,
              Colors.grey.shade400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            "Glass Effect",
            style: GoogleFonts.urbanist(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
