import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:elim_trust_2/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonationsPage extends StatefulWidget {
  const DonationsPage({super.key});

  @override
  State<DonationsPage> createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String? _selectedPaymentMethod; // To keep track of the selected radio button
  final TextEditingController _emailController = TextEditingController(); // Controller for email input
  final TextEditingController _namecontroller = TextEditingController(); // Controller for name input
  final TextEditingController _confirmemailController = TextEditingController(); // Controller for confirm email input
  int _selectedIndex = 1; // Variable to track the selected index for navigation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration of one wave cycle
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut), // Smooth ease-in/out curve
    );
    _selectedPaymentMethod = null; // Initialize with no selection
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: AppBar(
              title: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value), // Centered vertical offset
                    child: const Text(
                      '❤️Donations❤️',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.blue,
              elevation: 2,
              leading: Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Badge(
                        alignment: Alignment.topRight,
                        label: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(color: Colors.white, fontSize: 12),
                        child: IconButton(
                          icon: const Icon(Icons.notifications, color: Colors.blue),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Navigator.pushNamed(context, '/notifications');
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(), // This enables the bouncing effect
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'How would you like to contribute?',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Monetary Contributions:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 2.0,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Your donations help us continue our mission and support those in need. Every contribution counts, no matter how small.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Color.fromARGB(255, 120, 165, 201),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle 100 KES donation
                    },
                    child: const Text('100 KES', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle 200 KES donation
                    },
                    child: const Text('200 KES', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle 500 KES donation
                    },
                    child: const Text('500 KES', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Handle 1000 KES donation
                    },
                    child: const Text('1000 KES', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.monetization_on, color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Other Amount',
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'eg. 75,000 KES',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) {
                    // Handle custom donation amount
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Payment Methods:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
             
             

              Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      // Handle M-Pesa selection logic here
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('images/card.png', fit: BoxFit.cover, color: Colors.blue),),
                  ),
                  title: Center(
                    child: const Text('Credit/Debit Card', 
                    style: TextStyle(fontSize: 18, fontWeight: 
                    FontWeight.bold, color: Colors.blue,),),
                  ),

                  subtitle: Center(
                    child: const Text('Secure payment via visa, mastercard, etc.', 
                    style: TextStyle(fontSize: 16, 
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Arial',
                    color: Color.fromARGB(255, 107, 162, 207)),),
                  ),
                  trailing: Radio<String>(
                    value: 'card', // Unique value for Credit/Debit Card
                    groupValue: _selectedPaymentMethod,
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                      // Handle card selection logic here
                    },
                  ),
                ),
              ),



               Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      // Handle M-Pesa selection logic here
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        //color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('images/paypal.png',  fit: BoxFit.cover,),),
                  ),
                  title: Center(
                    child: const Text('PayPal', 
                    style: TextStyle(fontSize: 18, fontWeight: 
                    FontWeight.bold, color: Colors.blue,),),
                  ),

                  subtitle: Center(
                    child: const Text('Secure payment via PayPal ', 
                    style: TextStyle(fontSize: 16, 
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Arial',
                    color: Color.fromARGB(255, 107, 162, 207)),),
                  ),
                  trailing: Radio<String>(
                    value: 'paypal', // Unique value for PayPal
                    groupValue: _selectedPaymentMethod,
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                      // Handle PayPal selection logic here
                    },
                  ),
                ),
              ),


               Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      // Handle M-Pesa selection logic here
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                       // color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:Image.asset('images/applepay.png', fit: BoxFit.cover,)),
                  ),
                  title: Center(
                    child: const Text('Apple Pay', 
                    style: TextStyle(fontSize: 18, fontWeight: 
                    FontWeight.bold, color: Colors.blue,),),
                  ),

                  subtitle: Center(
                    child: const Text('Secure payment via Apple Pay', 
                    style: TextStyle(fontSize: 16, 
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Arial',
                    color: Color.fromARGB(255, 107, 162, 207)),),
                  ),
                  trailing: Radio<String>(
                    value: 'applepay', // Unique value for Apple Pay
                    groupValue: _selectedPaymentMethod,
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                      // Handle Apple Pay selection logic here
                    },
                  ),
                ),
              ),



               Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      // Handle M-Pesa selection logic here
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('images/mpesa.png', fit: BoxFit.cover,),),
                  ),
                  title: Center(
                    child: const Text('M-PESA Payment', 
                    style: TextStyle(fontSize: 18, fontWeight: 
                    FontWeight.bold, color: Colors.blue,),),
                  ),

                  subtitle: Center(
                    child: const Text('PayBill 891300, Account No: 109225', 
                    style: TextStyle(fontSize: 16, 
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Arial',
                    color: Color.fromARGB(255, 107, 162, 207)),),
                  ),
                  trailing: Radio<String>(
                    value: 'mpesa', // Unique value for M-PESA
                    groupValue: _selectedPaymentMethod,
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                      // Handle M-PESA selection logic here
                    },
                  ),
                ),
              ),






               const SizedBox(height: 20),
              const Text(
                'Donate Goods:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 2.0,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: const Text(
                  'Elim Trust accepts donations of goods such as clothing, food, and other essentials. Your contributions can make a significant difference in the lives of those we serve.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Color.fromARGB(255, 120, 165, 201),
                  ),
                ),
              ),


               Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Your Donations:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
             // const SizedBox(height: 10),
//dropdownbuttontextfield with dropdown menu:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.list, color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Select Donation Type',
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'clothing', child: Text('Clothing', style: TextStyle(color: Colors.blue))),
                    DropdownMenuItem(value: 'food', child: Text('Food', style: TextStyle(color: Colors.blue))),
                    DropdownMenuItem(value: 'utilities', child: Text('Utilities', style: TextStyle(color: Colors.blue))),
                    DropdownMenuItem(value: 'sponsor trainings', child: Text('Sponsor Trainings', style: TextStyle(color: Colors.blue))),
                    DropdownMenuItem(value: 'support initiatives', child: Text('Support Other Initiatives', style: TextStyle(color: Colors.blue))),
                    DropdownMenuItem(value: 'other', child: Text('Other', style: TextStyle(color: Colors.blue))),
                  ],
                  onChanged: (String? value) {
                    // Handle selection
                  },
                ),
              ),
              const SizedBox(height: 20),

              Text('Your details:',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                 //
                 // fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
Row(
  
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Please share your details so we can reach out',
    style: TextStyle(
      fontFamily: 'Arial',
      fontStyle: FontStyle.italic,
      fontSize: 16,
      color: Colors.grey,
    ),
    ),
    Text(
      '😊'
    ),
  ],
),

SizedBox(
  height: 35,
),
 //name
            Mytextfield(
              labelText: 'Name',
              hintText: 'John Doe',
              obscureText: false,
              keyboardType: TextInputType.name,
              controller: _namecontroller,  
            ),
            const SizedBox(height: 10),
            //email
            Mytextfield(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'john@example.com',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              

              
            ),
            const SizedBox(height: 10),
//confirm email
            Mytextfield(
              labelText: 'Confirm Email',
              hintText: 'john@example.com',
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              controller: _confirmemailController
              
            ),
            const SizedBox(height: 10),
//phone number
            Mytextfield(
              labelText: 'Phone Number',
              hintText: '+254 700 000 000',
              obscureText: false,
              keyboardType: TextInputType.phone,
              
            ),
            const SizedBox(height: 10),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Thank you for your generosity! Your support makes a difference!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
        color: Colors.grey,
      ),
    ),

    Text('🤩✨'),
    ],
),
            const SizedBox(height: 70), // Added space for bottom navigation bar

            ],
          ),// End of Column
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
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the AnimationController
    _namecontroller.dispose(); // Dispose the name controller
    _emailController.dispose(); // Dispose the email controller
    _confirmemailController.dispose(); // Dispose the confirm email controller
    super.dispose(); // Must be the last call
  }
}
