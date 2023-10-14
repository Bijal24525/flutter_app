import 'package:flutter/material.dart';

import 'calculation.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add navigation logic for Home here
              },
              child: Text('Home'),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () { 
                // Add navigation logic for Inventory here

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculationPage()),
                );
              },
              child: Text('Inventory'),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () {
                // Add navigation logic for Stock here
              },
              child: Text('Stock'),
            ),
            SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () {
                // Add exit logic here or use Navigator.pop(context) to go back
              },
              child: Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}
