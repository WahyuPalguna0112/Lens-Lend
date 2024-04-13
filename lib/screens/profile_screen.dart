import 'package:flutter/material.dart';
import 'second_screen.dart'; // Import file SecondScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigasi ke SecondScreen saat tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()), // Perubahan di sini
                );
              },
              child: Text('Go to Second Screen'),
            ),
            SizedBox(height: 20),
            Text('This is Profile Screen'),
          ],
        ),
      ),
    );
  }
}