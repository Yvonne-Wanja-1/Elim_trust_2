import 'package:elim_trust_2/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _firstNameError;
  String? _lastNameError;
  String? _emailError;
  String? _phoneError;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateFirstName);
    _lastNameController.addListener(_validateLastName);
    _emailController.addListener(_validateEmail);
    _phoneController.addListener(_validatePhoneNumber);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _validateFirstName() {
    setState(() {
      if (_firstNameController.text.isEmpty || _firstNameController.text.length < 2 || _firstNameController.text.length > 20 || _firstNameController.text.contains(RegExp(r'[^a-zA-Z\s]')) || _firstNameController.text.contains(RegExp(r'\d')) || _firstNameController.text.contains(RegExp(r'\s{2,}'))) {
        _firstNameError = 'Please enter your first name';
      } else {
        _firstNameError = null;
      }
    });
  }

  void _validateLastName() {
    setState(() {
      if (_lastNameController.text.isEmpty || _lastNameController.text.length < 2 || _lastNameController.text.length > 20 || _lastNameController.text.contains(RegExp(r'[^a-zA-Z\s]')) || _lastNameController.text.contains(RegExp(r'\d')) || _lastNameController.text.contains(RegExp(r'\s{2,}'))) {
        _lastNameError = 'Please enter your last name';
      } else {
        _lastNameError = null;
      }
    });
  }

  void _validateEmail() {
    setState(() {
      final email = _emailController.text;
      if (email.isEmpty) {
        _emailError = 'Please enter your email address';
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        _emailError = 'Please enter a valid email address';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePhoneNumber() {
    setState(() {
      if (_phoneController.text.isEmpty) {
        _phoneError = 'Please enter your phone number';
      } else if (!RegExp(r'^\+?[0-9]{10,}$').hasMatch(_phoneController.text)) {
        _phoneError = 'Please enter a valid phone number';
      }
      else {
        _phoneError = null;
      }
    });
  }

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
                    controller: _firstNameController,
                    labelText: 'First Name',
                    helperText: 'Enter your first name',
                    hintText: 'e.g. John',
                    errorText: _firstNameError,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  //last nemae:
                  const SizedBox(height: 20),
                  Mytextfield(
                    controller: _lastNameController,
                    labelText: 'Last Name',
                    helperText: 'Enter your last name',
                    hintText: 'e.g. Doe',
                    errorText: _lastNameError,
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),    
                  const SizedBox(height: 20),
                  //email:
                  Mytextfield(
                    controller: _emailController,
                    labelText: 'Email',
                    helperText: 'Enter your email address',
                    hintText: 'e.g. john.doe@example.com',
                    errorText: _emailError,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 20),
                  //phone number:
                  Mytextfield(
                    controller: _phoneController,
                    labelText: 'Phone Number',
                    helperText: 'Enter your phone number',
                    hintText: 'e.g. +254712345678',
                    errorText: _phoneError,
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