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
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            backgroundColor: const Color.fromARGB(255, 4, 135, 242),
            centerTitle: true,
            title: FadeTransition(
              opacity: _animationController,
              child: SlideTransition(
                position: _slideAnimation,
                child: const Text(
                  'Projects 📋',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
                      // Add menu logic here
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
