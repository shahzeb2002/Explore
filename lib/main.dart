import 'package:explore/appbar/classic.dart';
import 'package:explore/appbar/curved.dart';
import 'package:explore/appbar/glass.dart';
import 'package:explore/drawer/Classic_menu_drawer.dart';
import 'package:explore/drawer/curved_drawer.dart';
import 'package:explore/drawer/sliding%20drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: GlassAppBarDemo(),
    );
  }
}


