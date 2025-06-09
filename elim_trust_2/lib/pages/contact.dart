import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            
        ],
       
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