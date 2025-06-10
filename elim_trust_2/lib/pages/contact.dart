import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us',
        
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text('Get in Touch',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('''We would love to hear from you! Please reach out with any questions, suggestions or feedback 😊.
          If you have any inquiries or need assistance, feel free to contact us through any of the following channels:''',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // The SizedBox that was here has been moved to the bottomNavigationBar property
        ],
       
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
            mainAxisSize: MainAxisSize.min, // This is fine, SizedBox will control the outer height
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0), // Adjusted padding
                child: Text(
                  'Live. Love. Live.',
                  
                  // Assuming GoogleFonts.dancingScript is available or replace with TextStyle
                  style: GoogleFonts.dancingScript(

                    //fontFamily: 'DancingScript', // Example if GoogleFonts is not directly used here
                    fontSize: 16, // Slightly increased font size
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
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
                  const SizedBox(width: 4), // Spacing between icon and text
                  const Text('+254 705 558 885',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
                  const Spacer(), // Spacing between phone and email
                  Padding(
                        padding: const EdgeInsets.only( right: 4),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                                   onTap: () async {
                              const String emailAddress = 'info@elim-trust.org';
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: emailAddress,
                              );
                              if (!await launchUrl(emailLaunchUri)) {
                                print('Could not launch $emailLaunchUri');
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Could not open email app for $emailAddress. Please ensure an email app is configured.'),
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
                              child: const Icon(Icons.email_rounded, color: Colors.white)),
                          ),
                        ),
                  ),
                  const SizedBox(width: 4), // Spacing between icon and text
                  const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('info@elim-trust.org',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10), // Spacing between rows
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.blue),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://www.linkedin.com/in/elim-trust-org/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app'); 
                      if (!await launchUrl(url)) {
                        print('Could not launch $url');
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.instagram, color: Colors.blue),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://www.instagram.com/elimtrustorg?igsh=d2Q5djF1OGdmODJz&utm_source=qr');
                      if (!await launchUrl(url)) {
                        print('Could not launch $url');
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.xTwitter, color: Colors.blue),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://x.com/elim_trust_org?s=21');
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        print('Could not launch $url');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Could not open link: $url')),
                          );
                        }
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.blue),
                    onPressed: () async {
                      const String whatsappNumber = '254705558885';
                      final Uri url = Uri.parse('https://wa.me/$whatsappNumber');
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        print('Could not launch $url');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Could not open WhatsApp for $whatsappNumber. Please ensure WhatsApp is installed.')),
                          );
                        }
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://www.facebook.com/ElimTrustOrg/'); 
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        print('Could not launch $url');
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Could not open Facebook: $url')),
                          );
                        }
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.locationDot, color: Colors.red),
                    onPressed: () async {
                      final Uri url = Uri.parse('https://maps.google.com/?q=Elim+Trust+Nairobi');
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        print('Could not launch $url');
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    // Direct WhatsApp link to Elim Trust
    const String whatsappNumber = '254705558885'; // Elim Trust WhatsApp number
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
    );
  }
}