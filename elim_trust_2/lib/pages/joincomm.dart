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
            padding: const EdgeInsets.all(0), // Add some padding around the content
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 0),
                  child: const Text(
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
                ),
                SizedBox(height: 5),
              //scrollable images and their descriptions
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Horizontal scrolling for images
                child: Container(//the bigger container for the images
                  height: 200,
                  child: Row(children: [
Padding(
  padding: const EdgeInsets.all(8),
  child: Container(
    height: 200,
    width: 200,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
    ),
    clipBehavior: Clip.antiAlias, // This is crucial for rounding the image corners
    child: Image.asset(
      'images/trauma.jpg',
      fit: BoxFit.cover,
      
    ),
  ),
)
                  ],),
                
                ),
              )
              //latest news text
              ],
            ),
          ),
        ),
      ),
    );
  }
}