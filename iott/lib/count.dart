import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {

 
@override
  void initState() {
    super.initState();
    _fetchData();  // Call the _fetchData function here
  }


   int value = 0;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

   void _sendfood() {
    _databaseReference.child('bulb').set(1);
  }

     void _sendfoodd() {
    _databaseReference.child('bulb').set(0);
  }
  Future<void> _fetchData() async {
    DataSnapshot snapshot = await _databaseReference.child('bulb').get();

    setState(() {
      value = (snapshot.value as int?) ??0;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Count',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/picc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Count is = $value',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Define what happens when the button is pressed
                  _sendfood();
                },
                child: const Text('Blub turn ON!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                    _sendfoodd();
                  
                  // Define what happens when the button is pressed
                },
                child: const Text('Blub turn OFF!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

