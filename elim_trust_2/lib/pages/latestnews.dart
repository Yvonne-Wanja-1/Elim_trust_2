import 'package:flutter/material.dart';

class LatestnewsPage extends StatelessWidget {
  const LatestnewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 4, 135, 242), // Background color
            centerTitle: true,
            title: const Text(
              'Community',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 30, // Standard icon button size
                width: 30,  // Standard icon button size
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(30), // Circular shape
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  padding: EdgeInsets.zero, // Remove default padding
                  icon: const Icon(Icons.volunteer_activism, color: Colors.blue, size: 24), // Icon size
                  onPressed: () {
                    // Navigate to the donations page
                    Navigator.pushNamed(context, '/donations');
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 30, // Standard icon button size
                  width: 30,  // Standard icon button size
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(30), // Circular shape
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero, // Remove default padding
                    icon: const Icon(Icons.menu, color: Colors.blue), // Icon size
                    onPressed: () {
                      // Add functionality for the menu button here
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Latest News Content Goes Here',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}