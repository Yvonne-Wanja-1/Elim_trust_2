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
            backgroundColor: const Color.fromARGB(255, 4, 135, 242),
            centerTitle: true,
            title: const Text(
              'Latest News 📢',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center, // Center the icon within the container
                child: IconButton(
                  icon: const Icon(Icons.volunteer_activism, color: Colors.blue, size: 24),
                  padding: EdgeInsets.zero, // Remove default padding
                  constraints: const BoxConstraints(), // Remove default constraints
                  onPressed: () {
                    Navigator.pushNamed(context, '/donations');
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.red,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center, // Center the icon within the container
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.blue),
                    padding: EdgeInsets.zero, // Remove default padding
                    constraints: const BoxConstraints(), // Remove default constraints
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar Section
            GestureDetector(
              onTap: () {
                // Add functionality for the search bar tap here
              },
              child: Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purpleAccent,
                      Colors.red,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_rounded, color: Colors.white, size: 30),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Search for News...',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // News Content Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column( // Changed Row to Column to accommodate multiple children
                  children: [
                    Row( // First child: The original Row for news content
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '23rd September 2020',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Arial',
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 139, 193, 238),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0, right: 8.0),
                                child: Text(
                                  '''The Mental Health Awareness Toolk...
''',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Arial',
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'images/mentalhealth.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Second child: The Padding widget with buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              // Reduced padding to make the button smaller
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Read More 👇',
                              // Reduced font size
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Arial',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Added SizedBox for spacing between buttons
                          const Spacer(), // Made Spacer const for minor optimization
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Download PDF📥',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Arial',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ], // End of Column children
                ), // End of Column
              ),
            ),
          ],
        ),
      ),
    );
  }
}