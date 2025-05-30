import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Makes the animation loop back and forth

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.29).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

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
                backgroundColor: const Color.fromARGB(255, 4, 135, 242), // Optional: Added a background color
                centerTitle: true,
                title: ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Text(
                      'Community',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ),

                  //donation icon and label below it
                  leading: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      //margin: const EdgeInsets.only(left: 8.0), // Reduced margin to fit AppBar's leading area
                       height: 30, // Adjusted for a more standard icon button size
                       width: 30,  // Adjusted for a more standard icon button size
                      decoration: BoxDecoration(
                        color: Colors.white, // Optional: Added a background color
                        
                        borderRadius: BorderRadius.circular(30), // Make it circular (half of height/width)
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero, // Remove default IconButton padding for better control
                        icon: const Icon(Icons.volunteer_activism, color: Colors.blue, size: 24), // Standard icon size
                        onPressed: () {
                          //take to the donation page
                          Navigator.pushNamed(context, '/donations'); // Corrected route
                        },
                      ),
                    ),
                  ),
                  //menu icon

actions: [

 Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      //margin: const EdgeInsets.only(left: 8.0), // Reduced margin to fit AppBar's leading area
                       height: 30, // Adjusted for a more standard icon button size
                       width: 30,  // Adjusted for a more standard icon button size
                      decoration: BoxDecoration(
                        color: Colors.white, // Optional: Added a background color
                        
                        borderRadius: BorderRadius.circular(30), // Make it circular (half of height/width)
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero, // Remove default IconButton padding for better control
                        icon: const Icon(Icons.menu, color: Colors.blue, ) ,// Standard icon size
                        onPressed: () {
                          //take to the donation page
                          //Navigator.pushNamed(context, '/donations'); // Corrected route
                        },
                      ),
                    ),
                  ),



],
                  
                ), // Closing parenthesis for AppBar
            ), // Closing parenthesis for ClipRRect
      ), // Closing parenthesis for PreferredSize
      body: SingleChildScrollView( // Added SingleChildScrollView for vertical scrolling
        physics: const BouncingScrollPhysics(), // Optional: for a nice scroll effect
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0), // Increased padding for better spacing
              child: Center(
                child: Text('Our Team 💞',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 8.0), // Added padding
              physics: const BouncingScrollPhysics(), // Optional
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Removed this
                children: [
                  _buildTeamMember('images/persona.png', 'John Doe'),
                  const SizedBox(width: 24), // Added explicit spacing
                  _buildTeamMember('images/persona.png', 'Yvonne Wanja'),
                  const SizedBox(width: 24), // Added explicit spacing
                  _buildTeamMember('images/persona.png', 'Ann Wangui'),
                ],
              ),
            ),
            const SizedBox(height: 8), // Increased space
            //grid view of the our impact section:
            const Padding(
              padding: EdgeInsets.all(8.0), // Increased padding
              child: Center(
                child: Text('Our Impact 🌍' ,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0), // Added padding
              physics: const BouncingScrollPhysics(), // Optional
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Removed this
                children: [
                  _AnimatedImpactCard(title: 'Lives Transformed', valueString: '5000+'),
                  const SizedBox(width: 16), // Added explicit spacing
                  _AnimatedImpactCard(title: 'Projects Completed', valueString: '75+'), // Example data
                  const SizedBox(width: 16), // Added explicit spacing
                  _AnimatedImpactCard(title: 'Volunteers Involved', valueString: '2100+'), // Example data
                ],
              ),
            ),


















            const SizedBox(height: 20), // Add some padding at the bottom
              Center(
                child: Text('Our Key Impact Pillars 🌟' ,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ), 



            const SizedBox(height: 8), 
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 3.0), // Added padding
              physics: const BouncingScrollPhysics(), // Optional
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Removed this
                children: [
                  GestureDetector(
                    onDoubleTap: (){},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: Container(
                        width: 220,
                        height: 200,
                        //padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Research',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'Our studies in climate change, mental health, planetary health and SRH don’t just generate data they are packaged to influence policies empower common …',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Added space between cards

                   GestureDetector(
                    onDoubleTap: (){},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: Container(
                        width: 220,
                        height: 200,
                        //padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Capacity Building',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'By training religious and community leaders, we create a network of skilled individuals capable of providing essential psychosocial support and …',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Added space between cards
                   GestureDetector(
                    onDoubleTap: (){},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: Container(
                        width: 220,
                        height: 200,
                        //padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Implementation',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                'Our programs like Y-PREP equip youth in vulnerable communities with psycho-resilience and entrepreneurial skills, unlocking their potential to lead …',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                   ],
              ),
            ),
          ],
        ),
      ),
    );
  }





       
        
         

          
           
            
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// Helper widget for team members to reduce repetition
Widget _buildTeamMember(String imagePath, String name) {
  return Column(
    children: [
      CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(imagePath),
      ),
      const SizedBox(height: 8),
      Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blue,
          fontFamily: 'Arial',
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  );
}

// StatefulWidget for the animated impact card
class _AnimatedImpactCard extends StatefulWidget {
  final String title;
  final String valueString;

  const _AnimatedImpactCard({
    required this.title,
    required this.valueString,
  });

  @override
  _AnimatedImpactCardState createState() => _AnimatedImpactCardState();
}

class _AnimatedImpactCardState extends State<_AnimatedImpactCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _targetValue = 0;
  String _suffix = '';

  @override
  void initState() {
    super.initState();

    // Parse the valueString to get the number and suffix
    final numericPart = widget.valueString.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericPart.isNotEmpty) {
      _targetValue = int.tryParse(numericPart) ?? 0;
      _suffix = widget.valueString.replaceFirst(numericPart, '');
    } else {
      _targetValue = 0;
      _suffix = widget.valueString; // If no numbers, show original string
    }

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500), // Animation duration
      vsync: this,
    );

    // Determine the starting point for the animation (e.g., 85% of the target value)
    // This ensures the animation doesn't start from 0 if _targetValue is positive.
    double animationStartValue = _targetValue > 0 ? _targetValue.toDouble() * 0.85 : 0.0;

    _animation = Tween<double>(begin: animationStartValue, end: _targetValue.toDouble()).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {}); // Rebuild widget on animation ticks
      });

    _controller.addStatusListener((status) {
      if (!mounted) return; // Ensure widget is still in the tree

      if (status == AnimationStatus.completed) { // Finished counting up
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _controller.reverse();
          }
        });
      } else if (status == AnimationStatus.dismissed) { // Finished counting down
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _controller.forward();
          }
        });
      }
    });

    // Start the first animation cycle after an initial 2-second delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    height: 170,
    width: 170,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [ // Optional: add a little shadow for depth
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0), // Adjusted padding
            child: Text(
              '${_animation.value.toInt()}$_suffix', // Display animated value + suffix
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}