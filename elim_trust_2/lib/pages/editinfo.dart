import 'package:elim_trust_2/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(), // Added bouncing scroll physics
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Edit Your Personal Info ',
                      style: TextStyle(fontSize: 24,
                    
                       fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                       // fontFamily: 'Arial',
                        // fontStyle: FontStyle.italic,
                        //underline:
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationThickness: 2,
                      ),
                    
                      
                    
                    ),
                    Text('😊'),
                  ],
                ),
              ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Mytextfield(
                    controller: TextEditingController(),
                    labelText: 'First Name',
                    helperText: 'Enter your first name',
                    hintText: 'e.g. John',
                    errorText: 'Please enter a valid name',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  //last nemae:
                  const SizedBox(height: 20),
                  Mytextfield(
                    controller: TextEditingController(),
                    labelText: 'Last Name',
                    helperText: 'Enter your last name',
                    hintText: 'e.g. Doe',
                    errorText: 'Please enter a valid name',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),    
                  const SizedBox(height: 20),
                  //email:
                  Mytextfield(
                    controller: TextEditingController(),
                    labelText: 'Email',
                    helperText: 'Enter your email address',
                    hintText: 'e.g. john.doe@example.com',
                    errorText: 'Please enter a valid email',
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 20),
                  //phone number:
                  Mytextfield(
                    controller: TextEditingController(),
                    labelText: 'Phone Number',
                    helperText: 'Enter your phone number',
                    hintText: 'e.g. +254712345678',
                    errorText: 'Please enter a valid phone number',
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            
            ],
          ),
        ),
         floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Direct WhatsApp link to Elim Trust
            const String whatsappNumber =
                '254705558885'; // Elim Trust WhatsApp number
            final Uri url = Uri.parse('https://wa.me/$whatsappNumber');
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Could not open WhatsApp for $whatsappNumber. Please ensure WhatsApp is installed.')),
              );
              print('Could not launch $url');
            }
          },
          backgroundColor: Colors.green, // WhatsApp-like color
          child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
          tooltip: 'Chat on WhatsApp',
        ),
      ),
    );
  }
}