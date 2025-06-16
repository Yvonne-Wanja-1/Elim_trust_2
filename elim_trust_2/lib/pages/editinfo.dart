import 'package:elim_trust_2/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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

  void _validateName(TextEditingController controller,
      Function(String?) setError, String fieldName) {
    final value = controller.text;
    String? error;

    if (value.isEmpty) {
      error = '$fieldName is required.';
    } else if (value.length < 2) {
      error = '$fieldName must be at least 2 characters.';
    } else if (value.length > 20) {
      error = '$fieldName must not exceed 20 characters.';
    } else if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
      // This regex means "contains characters that are NOT letters (a-z, A-Z) and NOT whitespace".
      // This will catch digits and special symbols.
      error = '$fieldName can only contain letters and spaces.';
    } else if (RegExp(r'\s{2,}').hasMatch(value)) {
      // Checks for two or more consecutive whitespace characters.
      error = '$fieldName cannot contain consecutive spaces.';
    } else if (value.trim() != value) {
      // Checks for leading or trailing whitespace.
      error = '$fieldName cannot start or end with a space.';
    }
    setError(error);
  }

  void _validateFirstName() {
    setState(() {
      _validateName(_firstNameController, (error) => _firstNameError = error,
          'First name');
    });
  }

  void _validateLastName() {
    setState(() {
      _validateName(
          _lastNameController, (error) => _lastNameError = error, 'Last name');
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
      } else {
        _phoneError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine error texts using if statements
    String? currentFirstNameError;
    if (_firstNameError != null || _firstNameError!.isNotEmpty || _firstNameError!.trim().isNotEmpty || _firstNameError!.length > 0 || _firstNameError!.length < 2 || _firstNameError!.length > 20 || _firstNameError!.contains(RegExp(r'[^a-zA-Z\s]')) || _firstNameError!.contains(RegExp(r'\s{2,}'))) {
      currentFirstNameError = _firstNameError;
    } else {
      currentFirstNameError = null;
    }

    String? currentLastNameError;
    if (_lastNameError != null || _lastNameError!.isNotEmpty || _lastNameError!.trim().isNotEmpty || _lastNameError!.length > 0 || _lastNameError!.length < 2 || _lastNameError!.length > 20 || _lastNameError!.contains(RegExp(r'[^a-zA-Z\s]')) ) {
      currentLastNameError = _lastNameError;
    } else {
      currentLastNameError = null;
    }

    String? currentEmailError;
    if (_emailError != null || _emailError!.isNotEmpty || _emailError!.trim().isNotEmpty || _emailError!.length > 0 || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text)) {
      currentEmailError = _emailError;
    } else {
      currentEmailError = null;
    }

    String? currentPhoneError;
    if (_phoneError != null || _phoneError!.isNotEmpty || _phoneError!.trim().isNotEmpty || _phoneError!.length > 0 || !RegExp(r'^\+?[0-9]{10,}$').hasMatch(_phoneController.text)) {
      currentPhoneError = _phoneError;
    } else {
      currentPhoneError = null;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics:
              const BouncingScrollPhysics(), // Added bouncing scroll physics
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
                      style: TextStyle(
                        fontSize: 24,

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
                    errorText: currentFirstNameError,
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
                    errorText: currentLastNameError,
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
                    errorText: currentEmailError,
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
                    errorText: currentPhoneError,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                  ),

                  
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 150, // You can adjust this value to your desired height
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // This is fine, SizedBox will control the outer height
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0), // Adjusted padding
                  child: Text(
                    'Live. Love. Live.',
                    style: GoogleFonts.dancingScript(
                      textStyle: const TextStyle(
                        fontSize: 16, // Slightly increased font size
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  thickness: 1,
                  indent: 16, // Padding on the left
                  endIndent: 16,
                ),

                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 4),
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.red,
                                blurRadius: 5.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(Icons.phone, color: Colors.white)),
                    ),
                    const SizedBox(width: 4), // Spacing between icon a nd text
                    const Text('+254 705 558 885', // Made const
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                    const Spacer(), // Spacing between phone and email
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            const String emailAddress = 'info@elim-trust.org';
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: emailAddress,
                              // You can also pre-fill subject and body if needed:
                              // queryParameters: {
                              //   'subject': 'Inquiry from App User',
                              //   'body': 'Hello Elim Trust,\n\nI have a question...'
                              // }
                            );

                            if (!await launchUrl(emailLaunchUri)) {
                              print('Could not launch $emailLaunchUri');
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Could not open email app for $emailAddress. Please ensure an email app is configured.'),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.red,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.email_rounded,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4), // Spacing between icon and text
                    const Padding(
                      // Made const
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'info@elim-trust.org',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

// FloatingActionButton(

//               onPressed: () {
//                 // Add functionality for the WhatsApp button here
//               },
                SizedBox(height: 10), // Spacing between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Changed to spaceEvenly for better distribution
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin,
                          color: Colors.blue),
                      onPressed: () async {
                        // Replace with your LinkedIn URL
                        final Uri url = Uri.parse(
                            'https://www.linkedin.com/in/elim-trust-org/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');
                        if (!await launchUrl(url)) {
                          print('Could not launch $url');
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.instagram,
                          color: Colors.blue),
                      onPressed: () async {
                        // Replace with your Instagram URL
                        final Uri url = Uri.parse(
                            'https://www.instagram.com/elimtrustorg?igsh=d2Q5djF1OGdmODJz&utm_source=qr');
                        if (!await launchUrl(url)) {
                          print('Could not launch $url');
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.xTwitter,
                          color: Colors.blue),
                      onPressed: () async {
                        final Uri url =
                            Uri.parse('https://x.com/elim_trust_org?s=21');
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          // Optionally show a snackbar or dialog to the user
                          print('Could not launch $url');
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Could not open link: $url')),
                            );
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.whatsapp,
                          color: Colors.blue),
                      onPressed: () async {
                        // Example: Launch WhatsApp (replace with your specific link or number)
                        // For a specific number: 'https://wa.me/1XXXXXXXXXX' (international format)
                        // Or a general link: 'https://whatsapp.com/'
                        const String whatsappNumber =
                            '254705558885'; // Elim Trust WhatsApp number
                        final Uri url =
                            Uri.parse('https://wa.me/$whatsappNumber');
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          print('Could not launch $url');
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Could not open WhatsApp for $whatsappNumber. Please ensure WhatsApp is installed.')),
                            );
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.facebook,
                          color: Colors.blue),
                      onPressed: () async {
                        // Replace with your Facebook page URL
                        final Uri url =
                            Uri.parse('https://www.facebook.com/ElimTrustOrg/');
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          print('Could not launch $url');
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Could not open Facebook: $url')),
                            );
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.locationDot,
                          color: Colors.red),
                      onPressed: () async {
                        // Example: Open Google Maps with a specific location
                        // You can use a query string for a place name or coordinates
                        final Uri url = Uri.parse(
                            'https://maps.google.com/?q=Elim+Trust+Nairobi'); // Example query
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          print('Could not launch $url');
                          // Add SnackBar for error if needed
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),



         floatingActionButton:
    FloatingActionButton(
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
