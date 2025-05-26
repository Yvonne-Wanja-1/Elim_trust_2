import 'package:flutter/material.dart';

// Data model for our impact cards
class _ImpactCardData {
  final String imagePath;
  final String title;
  final String description;

  const _ImpactCardData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// Reusable widget for displaying an impact card
class _ImpactCardWidget extends StatelessWidget {
  final _ImpactCardData data;

  const _ImpactCardWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Defines the width of the card
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), // Slightly adjusted radius
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              data.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              data.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
                decoration: TextDecoration.underline, // Uncomment if you want underlined text
                decorationColor: Colors.blue, // Color of the underline
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              data.description,
              style: const TextStyle(
                fontSize: 14,
              
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
              textAlign: TextAlign.start,
              maxLines: 5, // Limit description lines for better UI
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class JoinCommunity extends StatelessWidget {
  const JoinCommunity({super.key});

  // Sample data for the impact cards.
  // In a real app, this might come from a database or API.
  //
  // IMPORTANT: Replace the placeholder image paths, titles, and descriptions
  // below with your actual content. Make sure the images exist in your
  // 'images/' asset folder and are declared in your pubspec.yaml.
  static final List<_ImpactCardData> _impactCardItems = [
    const _ImpactCardData(
      imagePath: 'images/trauma.jpg', // Replace with your image
      title: 'Y-PREP',
      description: 'Bridging trauma healing with entrepreneurship and climate action for youth in informal settlements',
    ),
    const _ImpactCardData(
      imagePath: 'images/mats dialog.jpg', // Replace with your image
      title: 'Mats Dialogue',
      description: 'Trauma healing-centred circles for teen mothers and women, rooted in African tradition and storytelling.',
    ),
    const _ImpactCardData(
      imagePath: 'images/equity.jpg', // Replace with your image
      title: 'Vunja Kalabash',
      description: 'Promoting gender equity through mental health and Sexual & Gender Based Violence intervention in learning institutions.',
    ),
    const _ImpactCardData(
      imagePath: 'images/capacity.jpg', // Replace with your image
      title: 'Capacity Building of Spiritual & Community Leaders',
      description: 'Equipping leaders to create grassroots healing movements and support trauma-informed community transformation',
    ),
    // const _ImpactCardData(
    //   imagePath: 'images/entrepreneurship.jpg', // Replace with your image
    //   title: 'Local Entrepreneurship',
    //   description: 'Fostering local businesses and economic growth within the community.',
    // ),
  ];

  @override                                                           
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        body: SingleChildScrollView( 
          physics: const BouncingScrollPhysics(),
          child: Column( // Removed redundant Padding(EdgeInsets.all(0))
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch, // Make children take full width
              children: [
                Container(
                  height: 300,
                  // width: double.infinity, // Column's crossAxisAlignment handles this
                  decoration: const BoxDecoration(
                    // You can add background color or other decorations here if needed
                  ),
                
                  child: Image.asset(
                    'images/join comm.png',
                    fit: BoxFit.cover, // Ensures the image covers the container
                    alignment: Alignment.topCenter, // Aligns image to top-center instead of center
                    // width: double.infinity, // BoxFit.cover and parent constraints handle this
                    // height: 70, // Height is controlled by the Container
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0), // Adjusted padding
                  child: const Text(
                    'Our Impact:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24, // Slightly larger font for better visibility
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial', // Ensure Arial is available or remove for default
                      fontStyle: FontStyle.italic,
                      color: Colors.blue, // Ensure this contrasts with Scaffold background
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Adjusted spacing
                // Horizontally scrollable list of impact cards
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding for the scrollable area
                  child: Row(
                    children: _impactCardItems.asMap().entries.map((entry) {
                      int idx = entry.key;
                      _ImpactCardData data = entry.value;
                      return Padding(
                        // Add right padding to all cards except the last one for spacing
                        padding: EdgeInsets.only(right: idx == _impactCardItems.length - 1 ? 0 : 16.0),
                        child: _ImpactCardWidget(data: data),
                      );
                    }).toList(),
                  ),
                ),
                // You can add more content below, like "latest news text"
                const SizedBox(height: 24), // Space before next section
                // Example: Placeholder for "Latest News"
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Text(
                //     'Latest News:',
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                //   ),
                // ),
                // SizedBox(height: 8),
                // ... more widgets for news items ...
              ],
            ),
        ),
      ),
    );
  }
}