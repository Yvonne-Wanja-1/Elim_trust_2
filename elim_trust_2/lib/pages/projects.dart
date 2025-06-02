import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProjectsPage> with SingleTickerProviderStateMixin {
  bool isOngoingSelected = true;
  int _selectedIndex = 0; // Define _selectedIndex with an initial value
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
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));}

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
                      'Projects 📋',
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
                  
                ),
              ),
            
      ),
      body: Column(
        children: [
          // Toggle Buttons
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                buildToggle("Ongoing", true),
                buildToggle("Completed", false),
              ],
            ),
          ),

          // Projects List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: isOngoingSelected
                  ? buildOngoingProjects()
                  : buildCompletedProjects(),
            ),
          ),
        ],
      ),








       bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: const Color.fromARGB(255, 4, 135, 242),
          height: 60,
          index: _selectedIndex,
          items: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.folder_open, size: 30, color: Colors.white),
                Text('Projects', style: TextStyle(color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.attach_money_rounded, size: 30, color: Colors.white),
                Text('Donations', style: TextStyle(color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.home, size: 30, color: Colors.white),
                Text('Home', style: TextStyle(color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(FontAwesomeIcons.peopleGroup, size: 30, color: Colors.white),
                Text('Community', style: TextStyle(color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.person, size: 30, color: Colors.white),
                Text('Profile', style: TextStyle(color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic)),
              ],
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });

            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/projects');
                break;
              case 1:
                Navigator.pushNamed(context, '/donations');
                break;
              case 2:
                Navigator.pushNamed(context, '/home');
                break;
              case 3:
                Navigator.pushNamed(context, '/community');
                break;
              case 4:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
        ),
    );
  }

  Widget buildToggle(String title, bool isOngoing) {
    final selected = isOngoingSelected == isOngoing;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOngoingSelected = isOngoing;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: selected
                ? Border(bottom: BorderSide(color: Colors.blue, width: 2))
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildOngoingProjects() {
    return [
      sectionTitle("Education"),
      projectCard("Empowering Minds", "Providing quality education to underprivileged children."),
      projectCard("Literacy for All", "Promoting literacy among adults and youth."),
    ];
  }

  List<Widget> buildCompletedProjects() {
    return [
      sectionTitle("Community"),
      projectCard("Completed Project A", "This project has been successfully completed."),
      projectCard("Completed Project B", "Another project completed recently."),
    ];
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget projectCard(String title, String description) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: TextButton(
          onPressed: () {},
          child: Text('View Details'),
        ),
      ),
    );
  }
}
