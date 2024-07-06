import 'package:flutter/material.dart';
import 'package:loginchat/cart_page.dart'; // Import the CartPage where the cart functionality is implemented

class CourseDescriptionPage extends StatelessWidget {
  final String title;
  final String description;

  CourseDescriptionPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey[700], // Match the color of the Login Page
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add course to cart
                  CartPage.addToCart(title); // Call the static method to add course to cart
                  // Show a snackbar or dialog confirming the addition to cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title added to cart'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  // Navigate to CartPage after adding to cart
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Text('Buy Now'), // Change button text to 'Buy Now'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
