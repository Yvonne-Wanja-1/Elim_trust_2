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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/persona.png'),
                  ),
                  Text('John Doe',
                    style: TextStyle(
                      fontSize: 16,
                     // fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/persona.png'),
                  ),
                  Text('Yvonne Wanja',
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/persona.png'),
                  ),
                  Text('Ann Wangui',
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )

    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}