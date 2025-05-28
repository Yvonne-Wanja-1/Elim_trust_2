import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elim_trust_2/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;


  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();

    // TODO: Initialize with actual user email if available
    // _emailController.text = "user@example.com"; 
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
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
            centerTitle: true,
            title: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                
                  Colors.purple,
                  Colors.orange,
                    Color.fromARGB(255, 11, 110, 192),
                  Colors.red,
                  Colors.yellow,
                  //Colors.black,
                 // Colors.pink,

                ],
              ).createShader(bounds),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Profile',
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Needed for ShaderMask
                    ),
                    speed: Duration(milliseconds: 150),
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
            backgroundColor: Colors.blue,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 5),
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.blue,
                  onPressed: () {
                    // Action for settings button
                  },
                ),
              ),
            ],
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: 
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10), // Add some space at the top
              //profile pic
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.png'), // Replace with your image
                ),
              ),
              //name
              Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
             // fontFamily: 'Arial',
              //fontStyle: FontStyle.italic,
              color: Colors.blue,
            ),
              ),
              SizedBox(height: 0.2), // Add some space between name and description
              //description
              Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Text(
                  'Member since January 2023',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 116, 175, 226),
                    fontFamily: 'Arial',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              //personal information
              SizedBox(height: 10),
              Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            SizedBox(height: 10),
            //email
            Mytextfield(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'john@example.com',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              

              
            ),
            SizedBox(height: 10),
            //password
            Mytextfield(
              controller: _passwordController,
              labelText: 'Password',
              hintText: '********',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 10),
            //name
            Mytextfield(
              controller: _nameController,
              labelText: 'Username',
              hintText: 'John Doe',
              obscureText: false,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 10),
            //phone
            Mytextfield(
              controller: _phoneController,
              labelText: 'Phone',
              hintText: '+1234567890',
              obscureText: false,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            //address
            Mytextfield(
              controller: _addressController,
              labelText: 'Address',
              hintText: '123 Main St, City, Country',
              obscureText: false,
              keyboardType: TextInputType.streetAddress,
            ),
           // SizedBox(height: 10),
            ],
          ),
        ),
      
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 4, 135, 242),
        height: 60,
        index: 4,
        items: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.folder_open, size: 30, color: Colors.white),
              Text('Projects',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.attach_money_rounded, size: 30, color: Colors.white),
              Text('Donations',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.home, size: 30, color: Colors.white),
              Text('Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(FontAwesomeIcons.peopleGroup,
                  size: 30, color: Colors.white),
              Text('Community',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.person, size: 30, color: Colors.white),
              Text('Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic)),
            ],
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/projects');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/donations');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/community');
              break;
            case 4:
              break;
          }
        },
      ),
    );
  }


}
 