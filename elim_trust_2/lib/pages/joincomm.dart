import 'package:flutter/material.dart';

class JoinCommunity extends StatelessWidget {
  const JoinCommunity({super.key});

  @override                                                           
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( // Scaffold should be a direct child of SafeArea for a page
        body: SingleChildScrollView( // This will make the content inside the body scrollable vertically
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add some padding around the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Make children take full width
              children: [
                Container(
                  height: 250,
                  // width: double.infinity, // Column's crossAxisAlignment handles this
                  decoration: const BoxDecoration(
                    // No need for color here if the image covers it entirely
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(20.0),
                    // ),
                  ),
                //  clipBehavior: Clip.antiAlias, // This is crucial for rounding the image corners
                  child: Image.asset(
                    'images/join comm.png',
                    fit: BoxFit.cover, // Ensures the image covers the container
                    // width: double.infinity, // BoxFit.cover and parent constraints handle this
                    // height: 70, // Height is controlled by the Container
                  ),
                ),
                const SizedBox(height: 8), // Add some space between the image and text
                const Text(
                  'Our Impact:',
                  textAlign: TextAlign.left, // Center the text
                  style: TextStyle(
                    fontSize: 24, // Slightly larger font for better visibility
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial', 
                    fontStyle: FontStyle.italic,
                    color: Colors.blue, // Ensure this contrasts with Scaffold background
                  ),
                ),
                // Your comment: "images scrollable horizontally and texts below the images"
                // This suggests a future feature. If you want a horizontal list here,
                // you would typically use a ListView.builder with scrollDirection: Axis.horizontal
                // or a Row inside another SingleChildScrollView.
                // For now, this structure fixes the black screen.
              ],
            ),
          ),
        ),
      ),
    );
  }
}