import 'package:flutter/material.dart';

class CurvedDrawerDemo extends StatefulWidget {
  const CurvedDrawerDemo({super.key});

  @override
  State<CurvedDrawerDemo> createState() => _CurvedDrawerDemoState();
}

class _CurvedDrawerDemoState extends State<CurvedDrawerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  void toggleDrawer() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade700,
            title: const Text("Curved Drawer"),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: toggleDrawer,
            ),
          ),
          body: const Center(
            child: Text("Curved Drawer ", style: TextStyle(fontSize: 20),
            ),
          ),
        ),

        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double slide = 250 * _animation.value;
            return Transform.translate(
              offset: Offset(slide - 250, 0),
              child: child,
            );
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Material(
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade800,
                        Colors.grey.shade600,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      // Drawer Header
                      DrawerHeader(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person,
                                  size: 35, color: Colors.grey.shade800),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Shah Zeb",
                              style: TextStyle(
                                color: Colors.grey.shade200,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "shahzeb@example.com",
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      drawerItem(Icons.home, "Home"),
                      drawerItem(Icons.person, "Profile"),
                      drawerItem(Icons.settings, "Settings"),
                      drawerItem(Icons.help_outline, "Help"),
                      Divider(color: Colors.grey.shade400),
                      drawerItem(Icons.logout, "Logout"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: toggleDrawer,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
