import 'package:flutter/material.dart';
import 'package:loginchat/paymentOption_page.dart';

class CartPage extends StatefulWidget {
  static List<String> cartItems = []; // Static list to hold cart items

  @override
  _CartPageState createState() => _CartPageState();

  static void addToCart(String courseTitle) {
    cartItems.add(courseTitle); // Add course to cart
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items in Cart:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: CartPage.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(CartPage.cartItems[index]),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        CartPage.cartItems.removeAt(index); // Remove item from cart
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CartPage.cartItems[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                CartPage.cartItems.removeAt(index); // Remove item from cart
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to payment options page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentOptionsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
