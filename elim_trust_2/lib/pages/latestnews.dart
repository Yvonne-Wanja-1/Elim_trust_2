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
                height: 30,
                width: 30,
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
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.volunteer_activism, color: Colors.blue, size: 24),
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
                  height: 30,
                  width: 30,
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
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.menu, color: Colors.blue),
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
        child: Padding(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2, // Allocate 2/3 of the space for the text
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
                            color: Color.fromARGB(255, 144, 180, 210),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 8.0, bottom: 12),
                        child: Text(
                          '''The Mental Health Awareness Toolkit for Communi...
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
                const SizedBox(width: 8), // Space between the text and the image
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                      width: 200, // Set the width of the image
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), // Rounded corners for the image
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
                          'images/mentalhealth.png', // Path to your image asset
                          fit: BoxFit.cover, // Adjust the image to cover the container
                        ),
                      ),
                    ),

                    ElevatedButton(onPressed: (){},
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                     ),
                     child: Text(
                      'Read More',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.white,
                      ),
                     ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}