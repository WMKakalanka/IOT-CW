import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pic.jpg'), // Updated path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Smart Refrigerator System",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30, // Increased font size for better visibility
                ),
              ),
              const SizedBox(height: 50), // Add some space between the title and button
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                               },
                child: const Text('Get Started!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
