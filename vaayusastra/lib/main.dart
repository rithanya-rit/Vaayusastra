import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import your splash screen
import 'login_page.dart'; // Import your login page
import 'home_page.dart';
import 'dashboard_page.dart';
import 'level1.dart';
import 'level2.dart';
import 'level3.dart';
import 'level4.dart';
import 'paymentOption_page.dart'; // Adjust the import according to your file location
import 'cart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Add this line
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: SplashScreen(), // Start with the splash screen
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/level1': (context) => Level1DetailPage(),
        '/level2': (context) => Level2DetailPage(),
        '/level3': (context) => Level3DetailPage(),
        '/level4': (context) => Level4DetailPage(),
        '/payment': (context) => PaymentOptionsPage(),
        '/upi': (context) => UpiPaymentPage(),
        '/credit_card': (context) => CreditCardPaymentPage(),
        '/debit_card': (context) => DebitCardPaymentPage(),
        '/paypal': (context) => PayPalPaymentPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
