import 'package:flutter/material.dart';
import 'package:elim_trust_2/widgets/appbar.dart'; // Make sure this file defines 'CustomAppBar'

class YprepPage extends StatefulWidget {
  const YprepPage({super.key});

  @override
  State<YprepPage> createState() => _YprepPageState();
}

class _YprepPageState extends State<YprepPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Adjust duration as you like
    );

    // Slide animation: from slightly above (e.g., -0.3 of its height) to its final position (Offset.zero)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3), // Start 30% of its height above
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic, // A nice smooth curve
    ));

    // Fade animation: from transparent (0.0) to fully opaque (1.0)
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    // Start the animation when the page is initialized
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Important to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: const Text(
              "Y-PREP PROGRAM",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        
        leadingIcon: Icons.arrow_back,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.volunteer_activism, color: Colors.blue),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Removed Expanded widget
          Container( 
            height: 250, // Now this height will be respected
            margin: const EdgeInsets.all(8.0), // Added some margin for better spacing
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFF7F7F7), // Kept for background if image doesn't fill
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect( // Ensures the image respects the container's border radius
             // borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/t.png',
                fit: BoxFit.contain, // Changed from BoxFit.cover to prevent stretching and show the whole image
                width: double.infinity, // The image will be contained within this width
                height: 250, // The image will be contained within this height
              ),
            ),
          ),
          // You can add more widgets here if needed

          
        ]
      )
    );
  }
}
