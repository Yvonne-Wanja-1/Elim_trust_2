import 'package:flutter/material.dart';


class DonationsPage extends StatelessWidget {
  const DonationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),// means 
          
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            
            child: AppBar(
              title: const Text('Donations'),
              centerTitle: true,  
              backgroundColor: Colors.blue, // Set your desired app bar color
              elevation: 2, 
              leading: Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color for the back button
                  borderRadius: BorderRadius.circular(50), // Make it circular
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.blue), // Icon for back button
                    padding: EdgeInsets.zero, // Remove default padding
                    constraints: const BoxConstraints(), // Allow button to shrink if needed
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                ),
              ),
              actions: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color for the back button
                  borderRadius: BorderRadius.circular(50), // Make it circular
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Badge(
                      alignment: Alignment.topRight, // Align the badge at the top right corner
                      label: Center(child: const Text('3', style: TextStyle(color: Colors.white))), // Badge content
                        backgroundColor: Colors.red, // Badge background color
                        textStyle: const TextStyle(color: Colors.white, fontSize: 12), // Center text style
                      child: IconButton(
                        icon: const Icon(Icons.notifications, color: Colors.blue),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          // Handle notification icon tap
                          Navigator.pushNamed(context, '/notifications'); // Navigate to notifications page
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}