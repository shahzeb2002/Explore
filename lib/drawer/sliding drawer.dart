import 'package:flutter/material.dart';

class SlidingDrawerDemo extends StatefulWidget {
  const SlidingDrawerDemo({super.key});

  @override
  State<SlidingDrawerDemo> createState() => _SlidingDrawerDemoState();
}

class _SlidingDrawerDemoState extends State<SlidingDrawerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double maxSlide = 250;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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
    return GestureDetector(
      onTap: () => _controller.isCompleted ? toggleDrawer() : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          double slide = maxSlide * _controller.value;
          double scale = 1 - (_controller.value * 0.1);

          return Stack(
            children: [

              buildDrawer(),

              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: buildMainPage(),
              ),
            ],
          );
        },
      ),
    );
  }

  // MAIN PAGE UI
  Widget buildMainPage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_controller.value * 20),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          centerTitle: true,
          title: Text(
            "Sliding Drawer",
            style: TextStyle(
              color: Colors.grey.shade100,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.grey.shade100),
            onPressed: toggleDrawer,
          ),
        ),
        body: const Center(
          child: Text(
            "Sliding Drawer ",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Material(
      child: Container(
        width: maxSlide,
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drawer Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey.shade900,
                      ),
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

              const SizedBox(height: 10),

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
