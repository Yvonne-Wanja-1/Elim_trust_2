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
              borderRadius: BorderRadius.circular(15.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(data.imagePath, fit: BoxFit.cover),
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
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
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
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
              maxLines: 5,
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

  static final List<_ImpactCardData> _impactCardItems = [
    const _ImpactCardData(
      imagePath: 'images/trauma.jpg',
      title: 'Y-PREP',
      description:
          'Bridging trauma healing with entrepreneurship and climate action for youth in informal settlements',
    ),
    const _ImpactCardData(
      imagePath: 'images/mats dialog.jpg',
      title: 'Mats Dialogue',
      description:
          'Trauma healing-centred circles for teen mothers and women, rooted in African tradition and storytelling.',
    ),
    const _ImpactCardData(
      imagePath: 'images/equity.jpg',
      title: 'Vunja Kalabash',
      description:
          'Promoting gender equity through mental health and Sexual & Gender Based Violence intervention in learning institutions.',
    ),
    const _ImpactCardData(
      imagePath: 'images/capacity.jpg',
      title: 'Capacity Building of Spiritual & Community Leaders',
      description:
          'Equipping leaders to create grassroots healing movements and support trauma-informed community transformation',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250, // Reduced height of the image container
                child: Image.asset(
                  'images/join comm.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0), // Reduced top padding
                child: const Text(
                  'Our Impact:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    fontStyle: FontStyle.italic,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 4), // Reduced spacing between "Our Impact:" and cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: _impactCardItems.asMap().entries.map((entry) {
                    int idx = entry.key;
                    _ImpactCardData data = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(right: idx == _impactCardItems.length - 1 ? 0 : 16.0),
                      child: _ImpactCardWidget(data: data),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8), // Adjusted spacing before "Latest News"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 135, 242), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Latest News',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '😊',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 0), // Adjusted spacing before news content
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                padding: const EdgeInsets.only(top: 8, bottom: 2), // Padding around the container
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 175, 211, 240),
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "🌍 UN H6 Joint Programme on RMNCAH (2015–2020):",
                              textAlign: TextAlign.left,
                            
                              
                              style: TextStyle(
                                  //underline:
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  decorationThickness: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, left : 25, top: 5),
                            child: Text(
                              '''
                In Mandera, we worked with adolescents and young mothers to advance reproductive and maternal health under this multi-agency initiative.''',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(50), 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('images/UN.jpg',
                          
                            fit: BoxFit.cover,
                          )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 21),
 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 135, 242), // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'Our Blogs',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '😊',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3), // Adjusted spacing before news content
              Container(padding: const EdgeInsets.only(top: 8, bottom: 2), // Padding around the container
                
              margin: const EdgeInsets.only(left: 5, right: 5,), // Margin around the container
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 175, 211, 240),
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                               '''👤By: Elim Insights
              Harmful Traditional Practices (HTPs)''',
                              textAlign: TextAlign.left,
                            
                              
                              style: TextStyle(
                                  //underline:
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  decorationThickness: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25, left : 25,),
                            child: Text(
                             // maxLines: 4,
                              '''
                Some Gender Based Violence acts are perpetuated by Harmful Traditional Practices (HTP). Harmful traditional practices like Female Genital Mutilation (FGM) , early and forced marriage are still being practiced by several communities in Africa and across the world. These backward and barbaric...''',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Arial',
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50), 
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('images/blogs.jpg',
                            fit: BoxFit.cover,
                          )),
                
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            
          ),
        ),
      ),
    );
  }
}